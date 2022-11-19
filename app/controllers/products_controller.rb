class ProductsController < ApplicationController

  before_action :product_variable, only: %i[show edit destroy] 
  
  def index
    @products = Product.all
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
    if @product = Product.update(product_params)
      redirect_to product_url(@product)
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:brand, :model, :price, :category, :sub_category, images: [])
  end

  def product_variable
    @product = Product.find(params[:id])
  end

end
