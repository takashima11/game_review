class RemoveCCommentFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :c_comment, :string
  end
end
