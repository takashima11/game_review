class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :post_id, null:false
      t.integer :customer_id, null:false
      t.string :c_follow, null:false
      t.text :follow_content, null:false

      t.timestamps
    end
  end
end
