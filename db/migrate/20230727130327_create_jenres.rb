class CreateJenres < ActiveRecord::Migration[6.1]
  def change
    create_table :jenres do |t|
      t.string :jenre_name, null:false
      t.string :game_console, null:false

      t.timestamps
    end
  end
end
