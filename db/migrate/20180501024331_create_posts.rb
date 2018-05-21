class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :sub_title
      t.text :content
      t.integer :upvotes
      t.integer :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
