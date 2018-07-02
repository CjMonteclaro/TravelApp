class TravellerTypesController < ApplicationController
  before_action :set_traveller_type, only: [:show, :edit, :update, :destroy]

  # GET /traveller_types
  # GET /traveller_types.json
  def index
    @traveller_types = TravellerType.all
  end

  # GET /traveller_types/1
  # GET /traveller_types/1.json
  def show
  end

  # GET /traveller_types/new
  def new
    @traveller_type = TravellerType.new
  end

  # GET /traveller_types/1/edit
  def edit
  end

  # POST /traveller_types
  # POST /traveller_types.json
  def create
    @traveller_type = TravellerType.new(traveller_type_params)

    respond_to do |format|
      if @traveller_type.save
        format.html { redirect_to @traveller_type, notice: 'Traveller type was successfully created.' }
        format.json { render :show, status: :created, location: @traveller_type }
      else
        format.html { render :new }
        format.json { render json: @traveller_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traveller_types/1
  # PATCH/PUT /traveller_types/1.json
  def update
    respond_to do |format|
      if @traveller_type.update(traveller_type_params)
        format.html { redirect_to @traveller_type, notice: 'Traveller type was successfully updated.' }
        format.json { render :show, status: :ok, location: @traveller_type }
      else
        format.html { render :edit }
        format.json { render json: @traveller_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traveller_types/1
  # DELETE /traveller_types/1.json
  def destroy
    @traveller_type.destroy
    respond_to do |format|
      format.html { redirect_to traveller_types_url, notice: 'Traveller type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traveller_type
      @traveller_type = TravellerType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traveller_type_params
      params.require(:traveller_type).permit(:name)
    end
end
