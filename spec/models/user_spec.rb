require 'spec_helper'

describe User do

  it 'should exist' do
    u = User.new
    u.should_not eq(nil)
  end
  
  it 'should be invalid without an email' do
    u = User.new
    u.should_not be_valid
  end

  it 'should be invalid if email exists in db' do
    u = User.new
    u.email = "test@email.com"
    u.terms = 1
    u.save
    u2 = User.new
    u2.email = "test@email.com"
    u2.terms = 1
    u2.should_not be_valid
  end

  it 'should have a collection' do
    u = User.new
    u.email = "test@email.com"
    u.terms = 1
    u.save
    c = u.collections.build
    u.collections.first.should_not eq(nil)
  end

  it 'should have photos in its collection' do
    u = User.new
    u.email = "test@email.com"
    u.terms = 1
    u.save
    c = u.collections.build
    p = c.photos.build
    u.collections.first.photos.first.should_not eq(nil)
  end

  it 'should delete collections when destroyed' do
    u = User.new
    u.email = "test@gmail.com"
    u.terms = 1
    u.save
    c = u.collections.build
    c.save
    u.destroy
    u.collections.first.should eq(nil)
  end

end