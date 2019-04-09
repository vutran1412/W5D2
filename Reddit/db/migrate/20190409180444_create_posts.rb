class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :content, null: false
      t.integer :sub_id
      t.integer :post_id
      t.integer :author, null: false

      t.timestamps
    end
    add_index :posts, :sub_id
    add_index :posts, :post_id
    add_index :posts, :author
  end
end
