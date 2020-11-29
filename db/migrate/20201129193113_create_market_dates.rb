class CreateMarketDates < ActiveRecord::Migration[6.0]
  def change
    create_table :market_dates do |t|
      t.references :market, null: false, foreign_key: true
      t.date :day
      t.integer :unique_customers
      t.jsonb :count

      t.timestamps
    end
  end
end
