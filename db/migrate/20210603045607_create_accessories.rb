class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.string :equipment, null: false
      t.string :name, null: false
      t.string :numeral
      t.string :identification
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
