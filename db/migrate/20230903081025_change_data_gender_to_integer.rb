class ChangeDataGenderToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :customers, :gender, :integer
  end
end
