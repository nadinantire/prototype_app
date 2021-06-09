class RemoveCompanyCodeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :company_code, :string
  end
end
