class RenameNameColumnToAccessories < ActiveRecord::Migration[5.2]
  def change
    rename_column :accessories, :name, :parts
  end
end
