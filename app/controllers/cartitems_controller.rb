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
        @cartitem.update(cartitem_params)
        redirect_to carts_path
    end

    private

    def cartitem_params
        params.require(:cartitem).permit(:quantity)
    end
end
