class Product < ApplicationRecord

    with_options presence: true do
        validates :status_id
        validates :shipping_cost_id
        validates :shipping_day_id
        validates :area_id
        validates :category_id
        validates :explanation
        validates :name
        validates :image
    end
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    has_one_attached :image
    belongs_to :user

    with_options numericality: { other_than: 1 } do
        validates :status_id
        validates :area_id
        validates :shipping_cost_id
        validates :shipping_day_id
        validates :category_id
    end

    #belongs_to_active_hash :prefecture
    #has_one :purchase
end
