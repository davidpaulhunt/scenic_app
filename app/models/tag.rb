class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true


  def self.all_tags
    Tag.pluck(:name)
  end
  
end