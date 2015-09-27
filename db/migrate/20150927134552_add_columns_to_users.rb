class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_reference :users, :user_detail, index: true, foreign_key: true
  end
end
