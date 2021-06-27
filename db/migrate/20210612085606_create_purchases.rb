class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :firm, null: false
      t.string :department, null: false
      t.string :position
      t.string :name, null: false
      t.date :acceptance_on, null: false
      t.string :delivery, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
