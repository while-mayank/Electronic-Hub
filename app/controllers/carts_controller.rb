class CartsController < ApplicationController

    def show
        @cart = Cart.find(params[:id])
    end

    def destroy
         @cart = Cart.find(params[:id])
         if @cart.destroy
            redirect_to products_url
    end
end
