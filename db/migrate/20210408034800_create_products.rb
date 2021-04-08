      t.string :shipping_cost
      t.string :shipping_days
      t.string :prefecrture_id, null: false
      t.string :judment
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.integer :shipping_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
