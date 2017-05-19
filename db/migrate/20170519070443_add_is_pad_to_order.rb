class AddIsPadToOrder < ActiveRecord::Migration[5.0]
    def change
        add_column :orders, :is_pad, :boolean, default: false
    end
end
