class AddStateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :state, :integer
  end
end
