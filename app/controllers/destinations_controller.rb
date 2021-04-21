class DestinationsController < ApplicationController
    before_action :set_product, only: :index
    before_action :authenticate_user!, only: :index
    before_action :move_to_index, only: :index
    before_action :set_destination, only: :index
    


    def index
        @destination = DestinationPurchase.new
    end

    def create
        @destination = DestinationPurchase.new(destination_params)
        if @destination.valid?
            pay_product
          @destination.save
          return redirect_to root_path
        else
          render 'index'
        end
    end
    
      private
    
    def destination_params
        params.require(:destination_purchase).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], product_id: params[:product_id])
    end

    def pay_product
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
        Payjp::Charge.create(
          amount: @product.price,  # 商品の値段
          card: destination_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
    end

    def move_to_index
        if current_user.id == @product.user_id
          redirect_to root_path
        end
    end

    def set_product
        @product = Product.find(params[:product_id])
    end

    def set_destination
        if @product.purchase.present? 
            redirect_to root_path
        end
    end
end
