class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.references :parent, index: true, foreign_key: true
      t.string :name
      t.boolean :is_parent, default: false

      t.timestamps null: false
    end
  end
end
