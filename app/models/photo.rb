class Photo < ActiveRecord::Base

  has_and_belongs_to_many :collections
  has_many :tags, as: :taggable
  has_many :comments, dependent: :destroy

  validates_presence_of :photo_upload

  accepts_nested_attributes_for :comments, allow_destroy: true

  mount_uploader :photo_upload, PhotoUploadUploader

end