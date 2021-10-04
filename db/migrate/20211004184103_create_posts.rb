class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :service, foreign_key: true

      t.timestamps
    end
  end
end
