class Change < ActiveRecord::Migration
  def change
    
    create_table :photos_tags do |t|
      t.integer :photo_id
      t.integer :tag_id
    end

    create_table :collections_tags do |t|
      t.integer :collection_id
      t.integer :tag_id
    end

    drop_table :taggables_tags

  end
end
