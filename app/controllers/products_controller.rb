class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index ]

    def new
        @product = Product.new
    end

    def index
        #@product = Product.all
        #@products = Product.includes(:user)
    end
 
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to root_path
        else
            render :new
        end
    end


    private
    def product_params
        params.require(:product).permit(:status_id, :shipping_day_id, :shipping_cost_id, :area_id, :category_id, :name, :explanation, :image,  :price).merge(user_id: current_user.id)
        
    end


end