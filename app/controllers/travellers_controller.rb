class TravellersController < ApplicationController

  authorize_resource

  include ActionView::Helpers::TextHelper

  before_action :set_traveller, only: [:show, :edit, :update, :destroy]

  def index
    @travellers = Traveller.all
  end

  def show
  end

  def new
    # @traveller = Traveller.new
    @quote = Quote.find(params[:id])
    @quote.travellers_count.times { @quote.travellers.build }
  end

  def edit
  end

  def create
    @traveller = Traveller.new(traveller_params)

    respond_to do |format|
      if @traveller.save
        format.html { redirect_to @traveller, notice: 'Traveller was successfully created.' }
        format.json { render :show, status: :created, location: @traveller }
      else
        format.html { render :new }
        format.json { render json: @traveller.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @quote = Quote.find(params[:id])
    current_user.quotes << @quote if current_user

    respond_to do |format|
      if @quote.update(quote_params)
        @quote.compute_total_due

        # EmailMailer.quote(current_user, @quote).deliver # *****

        format.html { redirect_to @quote, notice: "#{pluralize @quote.travellers_count, 'traveller'} successfully added. Please proceed to payment to get your policy." }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @traveller.update(traveller_params)
        format.html { redirect_to @traveller, notice: 'Traveller was successfully updated.' }
        format.json { render :show, status: :ok, location: @traveller }
      else
        format.html { render :edit }
        format.json { render json: @traveller.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @traveller.destroy
    respond_to do |format|
      format.html { redirect_to travellers_url, notice: 'Traveller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traveller
      @traveller = Traveller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traveller_params
      params.require(:traveller).permit(:quote_id, :policy_id, :first_name, :last_name, :birthdate, :age, :beneficiary, :travel_prem_id, :base_prem, :total_charges, :gross_prem)
    end

    def quote_params #(my_params)
      params.require(:quote).permit(travellers_attributes: [:id, :quote_id, :first_name, :last_name, :birthdate, :age, :beneficiary, :_destroy])
    end

end
