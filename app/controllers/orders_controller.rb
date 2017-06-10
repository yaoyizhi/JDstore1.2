class OrdersController < ApplicationController
    before_action :authenticate_user!
    def show
        @order = Order.find_by_token(params[:id])
        @productlists = @order.productlists
    end

    def create
        @order = Order.new(order_params)
        @order.user = current_user
        @order.total = current_cart.total_price

        if @order.save
            current_cart.cart_items.each do |cart_item|
                productlist = Productlist.new
                productlist.order = @order
                productlist.product_name = cart_item.product.title
                productlist.product_price = cart_item.product.price
                productlist.quantity = cart_item.quantity
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
        @order.make_payment!
        redirect_to order_path(@order.token), notice: '使用支付宝已成功付款'
    end

    def pay_with_wechat
        @order = Order.find_by_token(params[:id])
        @order.set_payment_with!('wechat')
        @order.make_payment!
        redirect_to order_path(@order.token), notice: '使用微信已成功付款'
    end

    def apply_to_cancel
        @order = Order.find(params[:id])
        OrderMailer.apply_cancel(@order).deliver!
        flash[:notice] = '已提交申请'
        redirect_to :back
    end

    private

    def order_params
        params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
