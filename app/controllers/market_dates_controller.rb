class MarketDatesController < ApplicationController
  require 'csv'
  require 'process-count'
  before_action :set_market_date, only: [:show, :edit, :update, :destroy]
  before_action :set_market, only: [:new, :edit, :update, :create, :destroy]

  # GET /market_dates
  # GET /market_dates.json
  def index
    @market_dates = MarketDate.all
  end

  # GET /market_dates/1
  # GET /market_dates/1.json
  def show
  end

  # GET /market_dates/new
  def new
    @market_date = MarketDate.new
  end

  # GET /market_dates/1/edit
  def edit
  end

  # POST /market_dates
  # POST /market_dates.json
  def create
    @file = params[:market_date][:count_file]
    @process = ProcessCountFile.new(@file.tempfile)
    @market_date = MarketDate.new(market_date_params)
    @market_date.market_id = @market.id
    @market_date.count = @process.map_minutes(20).to_json
    @market_date.unique_customers = @process.unique_customers
    respond_to do |format|
      if @market_date.save
        format.html { redirect_to market_market_date_path(@market, @market_date), notice: 'Market date was successfully created.' }
        format.json { render :show, status: :created, location: @market_date }
      else
        format.html { render :new }
        format.json { render json: @market_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /market_dates/1
  # PATCH/PUT /market_dates/1.json
  def update
    respond_to do |format|
      if @market_date.update(market_date_params)
        format.html { redirect_to @market_date, notice: 'Market date was successfully updated.' }
        format.json { render :show, status: :ok, location: @market_date }
      else
        format.html { render :edit }
        format.json { render json: @market_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_dates/1
  # DELETE /market_dates/1.json
  def destroy
    @market_date.destroy
    respond_to do |format|
      format.html { redirect_to @market, notice: 'Market date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_date
      @market_date = MarketDate.includes(:market).find(params[:id])
    end

    def set_market
      @market = Market.find(params[:market_id])
    end

    # Only allow a list of trusted parameters through.
    def market_date_params
      params.require(:market_date).permit(:market_id, :day)
    end
end
