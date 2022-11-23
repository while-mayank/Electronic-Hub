class OrderItemsController < ApplicationController
    def create
        @cart_items = CartItems.all
        @cart_items.each do |f|     
    end
end