require 'spec_helper'

describe Photo do

  it 'should exist' do
    p = Photo.new
    p.should_not eq(nil)
  end
  
  it 'should be invalid without photo_upload' do
    p = Photo.new
    p.should_not be_valid
  end

end