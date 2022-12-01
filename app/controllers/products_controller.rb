class ProductsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :product_variable, only: %i[show edit update destroy] 
  
  def all_cart_items
  end
  
  def index
    category = params[:category]
    if category.present?
      @products = Product.where(category: category )
    else
      @products = Product.all
    end
  end
  
  def show
  end

  def new
    @product = Product.new
  end

  def create
    if @product = current_user.products.create(product_params)
      redirect_to product_url(@product), notice: "Your Product has been created."
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_url(@product)
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_url
    end
  end

  private

  def product_params
    debugger
    params.require(:product).permit(:brand, :model, :price, :category, :sub_category, images: [])
  end

  def product_variable
    @product = Product.find(params[:id])
  end

end
