require "paymaya"

class QuotesController < ApplicationController

  authorize_resource

  before_action :set_quote, only: [:show, :edit, :update, :destroy, :paymaya_checkout]

  def index
    if current_user.has_role? :superadmin
      @quotes = Quote.includes(:countries, :destination_class)
    else
      @quotes = current_user.quotes.includes(:countries, :destination_class)
    end
  end

  def show
    @benefit_limits = BenefitLimit.where(destination_class_id: @quote.destination_class_id).includes(:benefit_category, :benefit)
  end

  def new
    @quote = Quote.new
    @travel_destinations = @quote.travel_destinations.build
  end

  def edit
    # @quote.travellers_count.times { @quote.travellers.build } unless @quote.travellers.present?
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.destination_class_id = Quote.find_destination_class(params[:quote][:country_ids]) unless params[:quote][:country_ids].reject { |c| c.empty? }.blank?

    respond_to do |format|
      if @quote.save
        @quote.compute_total_due
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @quote.destination_class_id = Quote.find_destination_class(params[:quote][:country_ids])

    respond_to do |format|
      if @quote.update(quote_params)
        # current_user.quotes << @quote if current_user
        @quote.compute_total_due
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def paymaya_checkout
    redirect_to checkout_success_path(quote_id: @quote.id)
    # redirect_to Paymaya::Checkout::Checkout.create(
    #     total_amount: @quote.checkout_total_amount,
    #     buyer: @quote.checkout_buyer(current_user),
    #     redirect_url: paymaya_urls,
    #     items: @quote.checkout_items,
    #     request_reference_number: "FGEN-#{Time.now.strftime('%Y%m%d%H%M').to_s}-#{@quote.id}"
    #   )[:redirect_url]
  end

  def paymaya_urls
    {
      success: "#{request.protocol + request.host_with_port + checkout_success_path(quote_id: @quote.id) }",
      failure: "#{request.protocol + request.host_with_port + checkout_failure_path(quote_id: @quote.id) }",
      cancel: "#{request.protocol + request.host_with_port + quote_path(quote_id: @quote.id) }",
    }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:user_id, :start_date, :end_date, :schengen_end_date, :duration, :destination_class_id, :traveller_type_id, :travellers_count, :travel_prem_id, :base_prem, :total_charges, :gross_prem,
        country_ids: [],
        travel_destinations_attributes: [:id, country_ids: []]
      )

    end
end
