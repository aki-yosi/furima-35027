class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :post_code
      t.integer :area_id
      t.string :city
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.integer :purchase_id, foreign_key: true 
      t.timestamps
    end
  end
end
