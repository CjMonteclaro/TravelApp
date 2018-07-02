class DestinationClassesController < ApplicationController
  before_action :set_destination_class, only: [:show, :edit, :update, :destroy]

  # GET /destination_classes
  # GET /destination_classes.json
  def index
    @destination_classes = DestinationClass.all
  end

  # GET /destination_classes/1
  # GET /destination_classes/1.json
  def show
  end

  # GET /destination_classes/new
  def new
    @destination_class = DestinationClass.new
  end

  # GET /destination_classes/1/edit
  def edit
  end

  # POST /destination_classes
  # POST /destination_classes.json
  def create
    @destination_class = DestinationClass.new(destination_class_params)

    respond_to do |format|
      if @destination_class.save
        format.html { redirect_to @destination_class, notice: 'Destination class was successfully created.' }
        format.json { render :show, status: :created, location: @destination_class }
      else
        format.html { render :new }
        format.json { render json: @destination_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destination_classes/1
  # PATCH/PUT /destination_classes/1.json
  def update
    respond_to do |format|
      if @destination_class.update(destination_class_params)
        format.html { redirect_to @destination_class, notice: 'Destination class was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination_class }
      else
        format.html { render :edit }
        format.json { render json: @destination_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destination_classes/1
  # DELETE /destination_classes/1.json
  def destroy
    @destination_class.destroy
    respond_to do |format|
      format.html { redirect_to destination_classes_url, notice: 'Destination class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination_class
      @destination_class = DestinationClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_class_params
      params.require(:destination_class).permit(:name)
    end
end
