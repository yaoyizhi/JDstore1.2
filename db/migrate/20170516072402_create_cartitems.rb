class CreateCartitems < ActiveRecord::Migration[5.0]
    def change
        create_table :cartitems do |t|
            t.integer :cart_id
            t.integer :product_id
            t.integer :quantity, default: 1
            t.timestamps
        end
    end
end
