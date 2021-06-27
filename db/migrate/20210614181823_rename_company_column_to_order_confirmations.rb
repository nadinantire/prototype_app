class RenameCompanyColumnToOrderConfirmations < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_confirmations, :company, :firm
  end
end
