class AddCatalogIdToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :catalog, index: true, foreign_key: true
  end
end
