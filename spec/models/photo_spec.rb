require 'spec_helper'

describe Photo do

  let(:photo) { FactoryGirl.create(:photo) }

  it 'should exist' do
    photo.save!
    photo.should_not eq(nil)
  end

  it 'should belong to a collection' do
    photo.save!
    c = photo.collections.build
    photo.collections.first.should_not eq(nil)
  end

  it 'should have a tag' do
    photo.save!
    t = photo.tags.build
    photo.tags.first.should_not eq(nil)
  end

end