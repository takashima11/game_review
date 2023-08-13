class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :jenre_id
      t.string :title
      t.text :item_caption
      t.string :label
      t.string :jan
      t.string :hardware
      t.string :item_url
      t.string :image_url
      t.string :sales_date

      t.timestamps
    end
  end
end
