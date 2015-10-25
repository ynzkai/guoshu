class CreateRecievers < ActiveRecord::Migration
  def change
    create_table :recievers do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.references :user

      t.timestamps null: false
    end
  end
end
