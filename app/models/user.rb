class User < ActiveRecord::Base
  
  has_many :collections, dependent: :destroy
  has_many :photos, through: :collections

  has_secure_password

  validates_presence_of :email, :password_confirmation
  validates_uniqueness_of :email
  validates :terms, :acceptance => {:accept => true}
  validates_confirmation_of :password

  accepts_nested_attributes_for :collections, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true

end