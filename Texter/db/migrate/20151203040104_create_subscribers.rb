class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :phone
      t.string :post_id

      t.timestamps null: false
    end
  end
end
