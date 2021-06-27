class AddTitleToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :title, :string
  end
end
