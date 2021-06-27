class CreateOrderConfirmations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_confirmations do |t|
      t.string :company, null: false
      t.string :department, null: false
      t.string :position
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
