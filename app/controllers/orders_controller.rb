class OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @productlists = @order.productlists
    end

    def create
        @order = Order.new(order_params)
        @order.user = current_user
        @order.total = current_cart.total_price

        if @order.save
            current_cart.cartitems.each do |cartitem|
                productlist = Productlist.new
                productlist.order = @order
                productlist.product_name = cartitem.product.title
                productlist.product_price = cartitem.product.price
                productlist.quantity = cartitem.quantity
                productlist.save
            end
            redirect_to order_path(@order)
        else
            render :checkout
        end
    end

    private

    def order_params
        params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
