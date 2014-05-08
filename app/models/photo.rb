class Photo < ActiveRecord::Base

  has_and_belongs_to_many :collections
  has_and_belongs_to_many :tags, :uniq => true
  has_many :comments, as: :commentable

  validates_presence_of :photo_upload

  accepts_nested_attributes_for :comments, allow_destroy: true

  mount_uploader :photo_upload, PhotoUploadUploader

end