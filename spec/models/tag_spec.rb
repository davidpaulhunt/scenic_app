require 'spec_helper'

describe Tag do

  let(:tag) { FactoryGirl.create(:tag) }
  
  it 'should exist' do
    tag.should_not eq(nil)
  end

  it 'should belong to a collection' do
    c = tag.collections.build
    tag.collections.first.should_not eq(nil)
  end

  it 'should belong to a photo' do
    tag.collections.build
    tag.collections.first.should_not eq(nil)
  end

end