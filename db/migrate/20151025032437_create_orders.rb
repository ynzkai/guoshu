class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.decimal :total
      t.integer :state, default: 0
      t.integer :pay_type, default: 0
      t.references :reciever
      t.references :user

      t.timestamps null: false
    end
  end
end
