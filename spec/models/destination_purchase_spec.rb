require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  before '#create' do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @destination = FactoryBot.build(:destination_purchase, user_id: user.id, product_id: product.id)
    sleep(1)
  end


  context '内容に問題ない場合' do
    it "post_code、area_id、token、city、address、building_name、phone_number、purchase_idがあれば保存ができること" do
      expect(@destination).to be_valid
    end

    it "building_nameがなくても登録できること" do
      @destination.building_name = nil
      expect(@destination).to be_valid
    end

    it "電話番号は11桁以内の数値のみ保存可能なこと" do
        @destination.phone_number = "00000000000"
        expect(@destination).to be_valid
    end

  end

  context '内容に問題がある場合' do

    it "post_codeが空では登録できないこと" do
      @destination.post_code = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Post code can't be blank")
    end

    it "post_codeにハイフンがないと登録できないこと" do
      @destination.post_code = "1234567"
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end


    it "area_idが空では登録できないこと" do
      @destination.area_id = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Area can't be blank")
    end

    it "cityが空では登録できないこと" do
      @destination.city = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空では登録できないこと" do
      @destination.address = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Address can't be blank")
    end

    it "user_idが空では登録できないこと" do
        @destination.user_id = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("User can't be blank")
    end

    it "product_idが空では登録できないこと" do
        @destination.product_id = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Product can't be blank")
    end


    it "電話番号は-(ハイフン)が使用されていると保存できないこと" do
        @destination.phone_number = "090-1111-1111"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号が11桁以上だと保存できないこと" do
        @destination.phone_number = "0000000000000"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
