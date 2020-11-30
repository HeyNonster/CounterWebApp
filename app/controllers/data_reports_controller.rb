class DataReportsController < ApplicationController
  def index
    @customers_by_market_kind = MarketDate.joins(:market).all.group(:kind).sum(:unique_customers)
    @customers_by_market_kind['Urban'] = @customers_by_market_kind.delete(0)
    @customers_by_market_kind['Suburban'] = @customers_by_market_kind.delete(1)
  end
end
