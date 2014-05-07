class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :photo_id
      t.string :content
    end
  end
end
