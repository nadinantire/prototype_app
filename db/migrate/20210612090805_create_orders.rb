class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :parts, null: false
      t.string :equipment, null: false
      t.string :numeral
      t.string :identification
      t.string :quantity, null: false
      t.text :remarks
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
