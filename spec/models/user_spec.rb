require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  it 'should exist' do
    user.should_not eq(nil)
  end
  
  it 'should be invalid without an email' do
    u = User.new(FactoryGirl.attributes_for(:no_email_user))
    u.should_not be_valid
  end

  it 'should be invalid if email exists in db' do
    user.save
    u2 = User.new(FactoryGirl.attributes_for(:user))
    u2.should_not be_valid
  end

  it 'should have a collection' do
    user.collections.first.should_not eq(nil)
  end

  it 'should have photos in its collection' do
    u = User.new
    u.email = "test@email.com"
    u.terms = 1
    user.save
    c = u.collections.build
    p = c.photos.build
    u.collections.first.photos.first.should_not eq(nil)
  end

  it 'should delete collections when destroyed' do
    user.save
    c = user.collections.build
    c.save
    user.destroy
    user.collections.first.should eq(nil)
  end

end