class BenefitLimitsController < ApplicationController
  before_action :set_benefit_limit, only: [:show, :edit, :update, :destroy]

  # GET /benefit_limits
  # GET /benefit_limits.json
  def index
    @benefit_limits = BenefitLimit.all
  end

  # GET /benefit_limits/1
  # GET /benefit_limits/1.json
  def show
  end

  # GET /benefit_limits/new
  def new
    @benefit_limit = BenefitLimit.new
  end

  # GET /benefit_limits/1/edit
  def edit
  end

  # POST /benefit_limits
  # POST /benefit_limits.json
  def create
    @benefit_limit = BenefitLimit.new(benefit_limit_params)

    respond_to do |format|
      if @benefit_limit.save
        format.html { redirect_to @benefit_limit, notice: 'Benefit limit was successfully created.' }
        format.json { render :show, status: :created, location: @benefit_limit }
      else
        format.html { render :new }
        format.json { render json: @benefit_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefit_limits/1
  # PATCH/PUT /benefit_limits/1.json
  def update
    respond_to do |format|
      if @benefit_limit.update(benefit_limit_params)
        format.html { redirect_to @benefit_limit, notice: 'Benefit limit was successfully updated.' }
        format.json { render :show, status: :ok, location: @benefit_limit }
      else
        format.html { render :edit }
        format.json { render json: @benefit_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefit_limits/1
  # DELETE /benefit_limits/1.json
  def destroy
    @benefit_limit.destroy
    respond_to do |format|
      format.html { redirect_to benefit_limits_url, notice: 'Benefit limit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit_limit
      @benefit_limit = BenefitLimit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefit_limit_params
      params.require(:benefit_limit).permit(:destination_class_id, :benefit_category_id, :benefit_id, :currency, :limit, :remarks, :from, :to)
    end
end
