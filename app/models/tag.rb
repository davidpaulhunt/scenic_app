class Tag < ActiveRecord::Base
  has_and_belongs_to_many :collections
  has_and_belongs_to_many :photos


  def self.all_tags
    Tag.pluck(:name)
  end
  
end