class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :post_id, null:false
      t.integer :customer_id, null:false
      t.string :c_comment, null:false
      t.text :comment_content, null:false

      t.timestamps
    end
  end
end
