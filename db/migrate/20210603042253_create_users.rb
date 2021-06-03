class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :company_code, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
