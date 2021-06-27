class RemoveOrderFromContractors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contractors, :order, foreign_key: true
  end
end
