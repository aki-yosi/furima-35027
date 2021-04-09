class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :shipping_cost_id
      t.integer :shipping_day_id
      t.integer :category_id
      t.integer :status_id
      t.integer :area_id
      t.text :explanation
      t.timestamps
    end
  end
  