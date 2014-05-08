class RemoveColumnComments < ActiveRecord::Migration
  def change
    remove_column :comments, :photo_id
  end
end
