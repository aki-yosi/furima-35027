class DestinationPurchase
    include ActiveModel::Model
    attr_accessor :user_id, :post_code, :area_id, :city, :address, :building_name, :phone_number, :token, :product_id
  
    with_options presence: true do
      validates :user_id
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :city
      validates :address
      validates :phone_number, format: {with: /\A\d{10,11}\z/ }
      validates :product_id
      validates :token
    end
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
      purchase = Purchase.create!(product_id: product_id, user_id: user_id)
      # 住所を保存する
      destination = Destination.create!(phone_number: phone_number, post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, purchase_id: purchase.id)
    end
end
