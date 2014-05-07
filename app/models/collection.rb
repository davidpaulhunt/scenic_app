class Collection < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :photos
  has_many :tags, as: :taggable

  accepts_nested_attributes_for :photos, allow_destroy: true
  
end