class TravelDestinationsController < ApplicationController
  before_action :set_travel_destination, only: [:show, :edit, :update, :destroy]

  # GET /travel_destinations
  # GET /travel_destinations.json
  def index
    @travel_destinations = TravelDestination.all
  end

  # GET /travel_destinations/1
  # GET /travel_destinations/1.json
  def show
  end

  # GET /travel_destinations/new
  def new
    @travel_destination = TravelDestination.new
  end

  # GET /travel_destinations/1/edit
  def edit
  end

  # POST /travel_destinations
  # POST /travel_destinations.json
  def create
    @travel_destination = TravelDestination.new(travel_destination_params)

    respond_to do |format|
      if @travel_destination.save
        format.html { redirect_to @travel_destination, notice: 'Travel destination was successfully created.' }
        format.json { render :show, status: :created, location: @travel_destination }
      else
        format.html { render :new }
        format.json { render json: @travel_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_destinations/1
  # PATCH/PUT /travel_destinations/1.json
  def update
    respond_to do |format|
      if @travel_destination.update(travel_destination_params)
        format.html { redirect_to @travel_destination, notice: 'Travel destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_destination }
      else
        format.html { render :edit }
        format.json { render json: @travel_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_destinations/1
  # DELETE /travel_destinations/1.json
  def destroy
    @travel_destination.destroy
    respond_to do |format|
      format.html { redirect_to travel_destinations_url, notice: 'Travel destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_destination
      @travel_destination = TravelDestination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_destination_params
      params.require(:travel_destination).permit(:quote_id, :country_id, :policy_id)
    end
end
