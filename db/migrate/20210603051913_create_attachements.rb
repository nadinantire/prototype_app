class CreateAttachements < ActiveRecord::Migration[5.2]
  def change
    create_table :attachements do |t|
      t.binary :file
      t.image :picture
      t.string :title
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
