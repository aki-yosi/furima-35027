class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :status_id     , null: false
      t.integer :shipping_cost_id     , null: false
      t.integer :shipping_day_id     , null: false
      t.integer :area_id      , null: false
      t.integer :category_id      , null: false
      t.timestamps
    end
  end
end
