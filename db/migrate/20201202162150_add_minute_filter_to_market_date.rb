class AddMinuteFilterToMarketDate < ActiveRecord::Migration[6.0]
  def change
    add_column :market_dates, :minute_filter, :integer, null: false, default: 5
  end
end
