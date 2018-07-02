class TravelPremsController < ApplicationController

  authorize_resource

  before_action :set_travel_prem, only: [:show, :edit, :update, :destroy]

  # GET /travel_prems
  # GET /travel_prems.json
  def index
    @travel_prems = TravelPrem.all
  end

  # GET /travel_prems/1
  # GET /travel_prems/1.json
  def show
  end

  # GET /travel_prems/new
  def new
    @travel_prem = TravelPrem.new
  end

  # GET /travel_prems/1/edit
  def edit
  end

  # POST /travel_prems
  # POST /travel_prems.json
  def create
    @travel_prem = TravelPrem.new(travel_prem_params)

    respond_to do |format|
      if @travel_prem.save
        format.html { redirect_to @travel_prem, notice: 'Travel prem was successfully created.' }
        format.json { render :show, status: :created, location: @travel_prem }
      else
        format.html { render :new }
        format.json { render json: @travel_prem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_prems/1
  # PATCH/PUT /travel_prems/1.json
  def update
    respond_to do |format|
      if @travel_prem.update(travel_prem_params)
        format.html { redirect_to @travel_prem, notice: 'Travel prem was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_prem }
      else
        format.html { render :edit }
        format.json { render json: @travel_prem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_prems/1
  # DELETE /travel_prems/1.json
  def destroy
    @travel_prem.destroy
    respond_to do |format|
      format.html { redirect_to travel_prems_url, notice: 'Travel prem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_prem
      @travel_prem = TravelPrem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_prem_params
      params.require(:travel_prem).permit(:destination_class_id, :travel_period_id, :premium, :prem_type, :from, :to)
    end
end
