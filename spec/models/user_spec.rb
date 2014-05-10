require 'spec_helper'

describe User do

  it 'should exist' do
    u = FactoryGirl.create(:user)
    u.should_not eq(nil)
  end
  
  it 'should be invalid without an email' do
    u = FactoryGirl.build(:no_email_user)
    u.should_not be_valid
  end

  it 'should be invalid if email exists in db' do
    u = FactoryGirl.create(:user)
    u2 = FactoryGirl.build(:user)
    u2.should_not be_valid
  end

  it 'should have a collection' do
    u = FactoryGirl.create(:user)
    u.collections.count.should eq(3)
  end

  it 'should have photos in its collection' do
    u = User.create(email: "test@email.com", terms: 1)
    c = u.collections.build
    p = c.photos.build
    u.collections.first.photos.first.should_not eq(nil)
  end

  it 'should delete collections when destroyed' do
    u = User.create!(FactoryGirl.attributes_for(:user))
    u.collections.create!
    u.destroy!
    c = Collection.last
    c.should eq(nil)
  end

end