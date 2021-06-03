class CreateOrderOverviews < ActiveRecord::Migration[5.2]
  def change
    create_table :order_overviews do |t|
      t.string :company
      t.string :department
      t.string :position
      t.string :name
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
