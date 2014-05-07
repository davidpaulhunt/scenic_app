class AddTaggableTypeToTags < ActiveRecord::Migration
  def change
    add_column :tags, :taggable_type, :string
  end
end
