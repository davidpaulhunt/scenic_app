class AddCreatedAtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :created_at, :timestamp
  end
end
