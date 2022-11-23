class OrdersController < ApplicationController
    before_action :authenticate_user!

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
            redirect_to @order
        end
    end

    private
    def order_params
        debugger
        params.require(:order).permit(:status, :address_id, :price)
    end
end
