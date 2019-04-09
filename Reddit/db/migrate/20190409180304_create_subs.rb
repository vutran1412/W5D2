class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :post_id
      t.integer :moderator, null: false
      t.integer :sub_id

      t.timestamps
    end
    add_index :subs, :post_id
    add_index :subs, :moderator
    add_index :subs, :sub_id
  end
end
