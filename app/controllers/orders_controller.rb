class OrdersController < ApplicationController
    before_action :authenticate_user!
    include PostOrder
    def index
        @orders = current_user.orders
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
    end

    def create
        @order = current_user.orders.create(order_params)
        if @order.save
            debugger
            create_order_items(@order)
            destroy_cart_items
            redirect_to @order
        end
    end

    private
    def order_params
        params.require(:order).permit(:status, :address_id, :price)
    end
end
