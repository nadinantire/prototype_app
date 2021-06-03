class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.text :remaks
      t.integer :delivery
      t.date :acceptance_on
      t.boolean :quotation
      t.boolean :carry
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
