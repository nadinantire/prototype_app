class AddAcceptanceOnToOrderConfirmations < ActiveRecord::Migration[5.2]
  def change
    add_column :order_confirmations, :acceptance_on, :date
  end
end
