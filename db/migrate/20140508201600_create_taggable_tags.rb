class CreateTaggableTags < ActiveRecord::Migration
  def change
    create_table :taggable_tags do |t|
      t.integer :tag_id
      t.integer :taggable_id
    end
  end
end
