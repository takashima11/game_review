class RemoveModelNameFromJenres < ActiveRecord::Migration[6.1]
  def change
    remove_column :jenres, :model_name, :string
  end
end
