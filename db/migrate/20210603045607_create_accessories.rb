class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.string :equipment
      t.string :name
      t.string :numeral
      t.string :identification
      t.order :references

      t.timestamps
    end
  end
end
