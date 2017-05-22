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
end
