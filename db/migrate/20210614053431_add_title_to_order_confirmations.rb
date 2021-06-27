class AddTitleToOrderConfirmations < ActiveRecord::Migration[5.2]
  def change
    add_column :order_confirmations, :title, :string, null: false
  end
end
