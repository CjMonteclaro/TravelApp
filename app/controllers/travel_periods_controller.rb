class TravelPeriodsController < ApplicationController
  before_action :set_travel_period, only: [:show, :edit, :update, :destroy]

  # GET /travel_periods
  # GET /travel_periods.json
  def index
    @travel_periods = TravelPeriod.all
  end

  # GET /travel_periods/1
  # GET /travel_periods/1.json
  def show
  end

  # GET /travel_periods/new
  def new
    @travel_period = TravelPeriod.new
  end

  # GET /travel_periods/1/edit
  def edit
  end

  # POST /travel_periods
  # POST /travel_periods.json
  def create
    @travel_period = TravelPeriod.new(travel_period_params)

    respond_to do |format|
      if @travel_period.save
        format.html { redirect_to @travel_period, notice: 'Travel period was successfully created.' }
        format.json { render :show, status: :created, location: @travel_period }
      else
        format.html { render :new }
        format.json { render json: @travel_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_periods/1
  # PATCH/PUT /travel_periods/1.json
  def update
    respond_to do |format|
      if @travel_period.update(travel_period_params)
        format.html { redirect_to @travel_period, notice: 'Travel period was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_period }
      else
        format.html { render :edit }
        format.json { render json: @travel_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_periods/1
  # DELETE /travel_periods/1.json
  def destroy
    @travel_period.destroy
    respond_to do |format|
      format.html { redirect_to travel_periods_url, notice: 'Travel period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_period
      @travel_period = TravelPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_period_params
      params.require(:travel_period).permit(:days)
    end
end
