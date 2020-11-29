class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.integer :kind
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
