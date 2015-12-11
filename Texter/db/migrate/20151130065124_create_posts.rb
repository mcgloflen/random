class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :text1
      t.string :text2
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
