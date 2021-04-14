class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    with_options presence: true do
        belongs_to :stauts
        belongs_to :area
        belongs_to :shipping_cost
        belongs_to :shipping_day
        belongs_to :category
    end

end
