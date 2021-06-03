class CreateOrderOverviews < ActiveRecord::Migration[5.2]
  def change
    create_table :order_overviews do |t|
      t.string :company, null: false
      t.string :department, null: false
      t.string :position
      t.string :name, null:false
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
