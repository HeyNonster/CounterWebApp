class CreateCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :counts do |t|

      t.timestamps
    end
  end
end
