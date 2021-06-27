class AddPurchaseIdToOrderConfirmations < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_confirmations, :purchase, foreign_key: true
  end
end
