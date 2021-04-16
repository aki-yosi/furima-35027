class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :show]
    before_action :authenticate_user!, except: [:index, :show, :edit]


    def new
        @product = Product.new
    end

    def index
        @products = Product.includes(:user).order("created_at DESC")
    end

    def edit
        redirect_to root_path unless current_user.id == @product.user_id
    end
 
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to root_path
        else
            render :new
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    def show
    end


    private
    def product_params
        params.require(:product).permit(:status_id, :shipping_day_id, :shipping_cost_id, :area_id, :category_id, :name, :explanation, :image,  :price).merge(user_id: current_user.id)
        
    end

    def set_product
        @product = Product.find(params[:id])
    end

end