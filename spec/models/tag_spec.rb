require 'spec_helper'

describe Tag do
  
  it 'should exist' do
    t = Tag.new
    t.should_not eq(nil)
  end

  it 'should belong to a taggable' do
    u = User.new
    u.email = "test@email.com"
    u.terms = 1
    u.save
    c = u.collections.build
    c.save
    t = c.tags.build
    t.save
    t.taggable.should_not eq(nil)
  end

end