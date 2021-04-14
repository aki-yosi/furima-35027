FactoryBot.define do
  factory :product do
    name { "hoge" }
    status_id { 5 }
    shipping_cost_id { 2 }
    shipping_day_id { 2 }
    area_id { 6 }
    category_id { 4 }
    price { "20000" }
    explanation {Faker::Lorem.sentence}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
