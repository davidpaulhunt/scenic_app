require 'spec_helper'

describe Collection do
  
  it 'should exist' do
    c = Collection.new
    c.should_not eq(nil)
  end

  it 'should have photos' do
    c = Collection.new
    p = c.photos.build
    c.photos.first.should_not eq(nil)
  end

  it 'should destroy photos when destroyed' do
    c = Collection.new
    c.save
    p = c.photos.build
    c.destroy!
    c.photos.first.should eq(nil)
  end

end