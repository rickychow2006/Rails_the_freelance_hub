class CreateUserfavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :userfavorites do |t|
      t.integer :"user_id"
      t.integer :"post_id"
      t.index ["post_id"], name: "index_user_favorites_on_post_id"
      t.index ["user_id"], name: "index_user_favorites_on_user_id"

      t.timestamps
    end
  end
end
