class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    with_options presence: true do
        belongs_to :stauts
        belongs_to :area
        belongs_to :shipping_cost
        belongs_to :shipping_day
        belongs_to :category
    end

    validates :status_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :shipping_cost_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
    validates :category_id, numericality: { other_than: 1 } 

end
