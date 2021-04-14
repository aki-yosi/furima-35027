class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :status_id
      t.integer :shipping_cost_id
      t.integer :shipping_day_id
      t.integer :area_id 
      t.integer :category_id 
      t.integer :price
      t.text :explanation
      t.string :name
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
