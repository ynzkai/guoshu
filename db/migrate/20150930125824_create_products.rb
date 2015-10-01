class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :unit
      t.integer :amount

      t.timestamps null: false
    end
  end
end
