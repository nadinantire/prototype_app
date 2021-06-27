class RemoveAcceptanceOnFromContractors < ActiveRecord::Migration[5.2]
  def change
    remove_column :contractors, :acceptance_on, :date
  end
end
