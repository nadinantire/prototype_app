class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :numeral
      t.string :identification
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
