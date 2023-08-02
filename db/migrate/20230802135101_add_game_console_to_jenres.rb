class AddGameConsoleToJenres < ActiveRecord::Migration[6.1]
  def change
    add_column :jenres, :game_console, :string, null:false
  end
end
