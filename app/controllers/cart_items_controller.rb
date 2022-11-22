class CartItemsController < ApplicationController
    before_action :cart_variable, only: %i[edit update destroy increment decrement]

    def index
        @cart_items = CartItem.all
    end

    def new
        @cart_item = CartItem.new
    end 

    def create
        @cart_item = current_user.cart.cart_items.create(cart_items_params)
        respond_to do |format|
            if @cart_item.save
                format.js
            else 
                redirect_to :back , notice: "item is not added to cart"
            end
        end
    end

    def edit
    end

    def update
        @cart_item.update(cart_items_params)
        respond_to do |format|
            if @cart_item.update
                format.js
            else 
                redirect_to :back , notice: "item is not added to cart"
            end
        end
    end

    def destroy
        respond_to do |format|
            if @cart_item.delete
                format.js
            else
                redirect_to :back , notice: "item is not added to cart"
            end
        end  
    end

    def increment
        respond_to do |format|
            if @cart_item.update(quantity: @cart_item.quantity + 1)
                format.js
            else
                format.html
            end
        end
    end

    def decrement
        respond_to do |format|
            if @cart_item.update(quantity: @cart_item.quantity - 1)
                format.js
            else
                format.html 
            end
        end
    end

    private

    def cart_items_params
        debugger
        params.require(:cart_items).permit(:quantity, :product_id)
    end

    def cart_variable
        @cart_item = CartItem.find(params[:id])
    end

end
