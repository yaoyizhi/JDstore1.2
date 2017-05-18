class OrdersController < ApplicationController
    def create
        @cart = current_cart
        @order = Order.new(order_params)
        if @order.save
            redirect_to productlist_path
        else
            render :checkout
        end
    end

    private

    def order_params
        params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
