class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.integer :price, null: false
      t.integer :tax, null: false
      t.integer :discount, null: false
      t.integer :total, null: false
      t.date :due_on, null: false
      t.date :acceptance_on, null: false
      t.references :order_confirmation, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
