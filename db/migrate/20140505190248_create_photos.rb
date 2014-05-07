class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_upload
    end

    create_table :collections do |t|
      t.integer :user_id
      t.string :name
      t.string :description
    end

    create_table :collections_photos, id: false do |t|
      t.integer :collection_id
      t.integer :photo_id
    end

    create_table :tags do |t|
      t.integer :taggable_id
      t.string :name
    end

  end
end
