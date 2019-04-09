class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :author, null: false
      t.integer :post_id
      t.integer :comment_id

      t.timestamps
    end
    add_index :comments, :author
    add_index :comments, :post_id
    add_index :comments, :comment_id
  end
end
