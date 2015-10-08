class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index "likes", ["user_id", "product_id"], name: "index_likes_on_user_id_and_product_id", unique: true
  end
end
