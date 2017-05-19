class EditColumn < ActiveRecord::Migration[5.0]
    def change
        rename_column :orders, :is_pad, :is_paid
    end
end
