class RemoveDiscountcontractors < ActiveRecord::Migration[5.2]
  def change
    remove_column :contractors, :discount, :integer
  end
end
