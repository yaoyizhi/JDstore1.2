class CartitemsController < ApplicationController
    def destroy
        @cart = current_cart
        @cartitem = @cart.cartitems.find_by(product_id: params[:id])
        @product = @cartitem.product
        @cartitem.destroy

        flash[:warning] = "成功将#{@product.title} 从购物车删除！"
        redirect_to :back
    end

    def update
        @cart = current_cart
        @cartitem = @cart.cartitems.find_by(product_id: params[:id])
        if @cartitem.product.quantity >= cartitem_params[:quantity].to_i
            @cartitem.update(cartitem_params)
            flash[:notice] = '成功变更数量'
        else
            flash[:warning] = '数量不足以加入购物车'
      end
        redirect_to carts_path
    end

    private

    def cartitem_params
        params.require(:cartitem).permit(:quantity)
    end
end
