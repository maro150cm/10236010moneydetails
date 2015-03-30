class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.date :cost_date
      t.string :item
      t.integer :money

      t.timestamps null: false
    end
  end
end
