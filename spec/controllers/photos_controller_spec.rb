require 'spec_helper'

describe PhotosController do

  let(:user) { FactoryGirl.create(:user) }
  let(:collection) { user.collections.first }
  let(:photo) { collection.photos.build }

  describe 'POST #create' do
    it 'creates a photo' do
      total = Photo.all.count
      photo = collection.photos.build(FactoryGirl.attributes_for(:photo))
      photo.save!
      Photo.all.count.should > total
    end
  end

  describe 'GET #show' do
    it 'assigns @photo' do
      login(user)
      photo.save!
      get :show, id: photo.id
      assigns(:photo).should_not eq(nil)
    end

    it 'assigns @taggable' do
      login(user)
      photo.save!
      get :show, id: photo.id
      assigns(:taggable).should_not eq(nil)
    end

    it 'assigns @new_tag' do
      login(user)
      photo.save!
      get :show, id: photo.id
      assigns(:new_tag).should_not eq(nil)
    end

    it 'assigns @new_comment' do
      login(user)
      photo.save!
      get :show, id: photo.id
      assigns(:new_comment).should_not eq(nil)
    end
  end

  describe 'DELETE #destroy' do
    # it 'should destroy the photo' do
    #   login(user)
    #   total = Photo.all.count
    #   photo1 = collection.photos.build(FactoryGirl.attributes_for(:photo))
    #   photo1.save!
    #   delete :destroy, collection_id: collection.id, id: photo1.id
    #   Photo.all.count.should < total
    # end
    # it 'should redirect to logout' do
    #   login(user)
    #   photo.save!
    #   delete :destroy, id: photo.id
    #   response.should redirect_to collection_path
    # end
  end

end