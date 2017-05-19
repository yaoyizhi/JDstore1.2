class OrdersController < ApplicationController
    def show
        @order = Order.find_by_token(params[:id])
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
            current_cart.clean!
            OrderMailer.notify_order_placed(@order).deliver!
            redirect_to order_path(@order.token)
        else
            render :checkout
        end
    end

    def pay_with_alipay
        @order = Order.find_by_token(params[:id])
        @order.set_payment_with!('alipay')
        @order.pay!
        redirect_to order_path(@order.token), notice: '使用支付宝已成功付款'
    end

    def pay_with_wechat
        @order = Order.find_by_token(params[:id])
        @order.set_payment_with!('wechat')
        @order.pay!
        redirect_to order_path(@order.token), notice: '使用微信已成功付款'
    end

    private

    def order_params
        params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
