require 'spec_helper'

describe Tag do
  
  it 'should exist' do
    t = Tag.new(FactoryGirl.attributes_for(:tag))
    t.should_not eq(nil)
  end

  it 'should have a collection' do
    u = User.create!(FactoryGirl.attributes_for(:user))
    User.last.collections.create!(FactoryGirl.attributes_for(:collection))
    Collection.last.tags.create!(FactoryGirl.attributes_for(:tag))
    Tag.last.collections.should_not eq(nil)
  end

end