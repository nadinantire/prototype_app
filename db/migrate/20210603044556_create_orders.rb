class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity, null: false
      t.text :remarks
      t.integer :delivery, null: false
      t.date :acceptance_on, null: false
      t.boolean :quotation, null: false, default: false
      t.boolean :carry, null: false, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
