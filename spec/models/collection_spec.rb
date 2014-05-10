require 'spec_helper'

describe Collection do

  let(:collection) { FactoryGirl.create(:collection) }
  
  it 'should exist' do
    collection.should_not eq(nil)
  end

  it 'should have photos' do
    p = collection.photos.build
    collection.photos.first.should_not eq(nil)
  end

  it 'should destroy photos when destroyed' do
    p = collection.photos.build
    collection.destroy!
    collection.photos.first.should eq(nil)
  end

  it 'should have tags' do
    collection.save!
    t = collection.tags.build
    collection.tags.first.should_not eq(nil)
  end

end