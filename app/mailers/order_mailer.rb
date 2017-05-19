class OrderMailer < ApplicationMailer
    def notify_order_placed(order)
        @order = order
        @user = order.user
        @productlists = @order.productlists

        mail(to: @user.email, subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
    end
end
