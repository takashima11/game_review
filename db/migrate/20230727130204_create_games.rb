class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :jenre_id, null:false
      t.string :name, null:false
      t.text :introduction, null:false
      t.date :release_date, null:false

      t.timestamps
    end
  end
end
