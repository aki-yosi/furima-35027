class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    with_options presence: true do
        belongs_to :stauts
        belongs_to :area
        belongs_to :shipping_cost
        belongs_to :shipping_day
        belongs_to :category
    end
    with_options numericality: { other_than: 1 } do
        validates :status_id
        validates :area_id
        validates :shipping_cost_id
        validates :shipping_day_id
        validates :category_id
    end

end
