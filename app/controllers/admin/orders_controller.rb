class Admin::OrdersController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :required_is_admin

    def index
        @orders = Order.order('id DESC')
    end

    def show
        @order = Order.find(params[:id])
        @productlists = @order.productlists
    end

    def ship
        @order = Order.find(params[:id])
        @order.ship!
        OrderMailer.notify_ship(@order).deliver!
        redirect_to :back
    end

    def shipped
        @order = Order.find(params[:id])
        @order.deliver!
        redirect_to :back
    end

    def cancel
        @order = Order.find(params[:id])
        @order.cancel_order!
        OrderMailer.notify_cancel(@order).deliver!

        redirect_to :back
    end

    def return
        @order = Order.find(params[:id])
        @order.return_good!
        redirect_to :back
    end
end
