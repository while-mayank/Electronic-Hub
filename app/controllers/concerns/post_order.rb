module PostOrder
    extend ActiveSupport::Concern

    included do
        def create_order_items(order)
            @cart_items = current_user.cart.cart_items
            @cart_items.each do |item|
                amount = calculate(item.quantity, item.product.price)
                order.order_items.create(product: item.product, price: amount, qunatity: item.quantity)
            end
        end

        def destroy_cart_items
            current_user.cart.cart_items.destroy_all
        end

        def calculate(quantity, unit_price)
            price = quantity * unit_price
        end

    end

    class_methods do

    end
end