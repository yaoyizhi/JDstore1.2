class Cart < ApplicationRecord
    has_many :cartitems
    has_many :products, through: :cartitems, source: :product

    def add_product_to_cart(product)
        ci = cartitems.build
        ci.product = product
        ci.quantity = 1
        ci.save
    end
end
