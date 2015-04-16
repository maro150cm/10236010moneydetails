class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]

  # GET /costs
  # GET /costs.json
  def index
      @puts=['01','02','03','04','05','06','07','08','09','10','11','12']
      @month=[]
      @money=[]
      (0..11).each do |i|
         @month[i] = Cost.where(['cost_date between ? and ?','2015-'+@puts[i]+'-01','2015-'+@puts[i]+'-31']).order('cost_date desc')
         @money[i] = Cost.where(['cost_date between ? and ?','2015-'+@puts[i]+'-01','2015-'+@puts[i]+'-31']).sum(:money)
      end
      @re_mon = params[:re_mon]
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @cost = Cost.new
  end

  # GET /costs/1/edit
  def edit
  end

  # POST /costs
  # POST /costs.json
  def create
    @cost = Cost.new(cost_params)
    respond_to do |format|
      if @cost.save
        format.html { redirect_to action: :index, re_mon: @cost.cost_date.strftime("%m").to_i-1, notice: 'Cost was successfully created.' }
        format.json { render :show, status: :created, location: @cost }
      else
        format.html { render :new }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    respond_to do |format|
      if @cost.update(cost_params)
        format.html { redirect_to action: :index, re_mon: @cost.cost_date.strftime("%m").to_i-1 , notice: 'Cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, re_mon: @cost.cost_date.strftime("%m").to_i-1, notice: 'Cost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_params
      params.require(:cost).permit(:cost_date, :item, :money)
    end
end
