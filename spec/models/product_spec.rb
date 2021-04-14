require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '出品できる場合' do
      it "status_id、shipping_cost_id、shipping_day_id、area_id、category_id、price、explanation、name、image、が存在すれば登録できること" do
        expect(@product).to be_valid
      end
    end

    context '出品できない場合' do
      it 'nameが空では登録できないこと' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'status_idが空では登録できないこと' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_cost_idが空では登録できないこと' do
        @product.shipping_cost_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it 'shipping_day_idが空では登録できないこと' do
        @product.shipping_day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'area_idが空では登録できないこと' do
        @product.area_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it 'category_idが空では登録できないこと' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では登録できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'explanationが空では登録できないこと' do
        @product.explanation = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it '販売価格が300以下では登録できないこと' do
        @product.price = 250
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it '販売価格が全角数字では登録できないこと' do
        @product.price = １００００
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it '値段が半角英数混合では登録できないこと' do
        @product.price = "1text11"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it '値段が半角英語だけでは登録できないこと' do
        @product.price = "aaaaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it '値段が10_000_000円以上の場合は登録できない' do
        @product.price = 100000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it 'カテゴリーが1の場合は登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が1の場合は登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担が1の場合は登録できない' do
        @product.shipping_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost must be other than 1")
      end
      it '発送までの日数が1の場合は登録できない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it '発送元の地域が1の場合は登録できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 1")
      end
      it 'userが紐付いていない場合は登録できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
