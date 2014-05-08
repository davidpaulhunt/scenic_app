class RemoveTagsTaggableId < ActiveRecord::Migration
  def change
    remove_column :tags, :taggable_id
    remove_column :tags, :taggable_type
    add_column :taggable_tags, :taggable_type, :string
    rename_table :taggable_tags, :taggables_tags
  end
end
