require 'spec_helper'

describe CollectionsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:collection) { user.collections.first }

  describe 'GET #new' do

    it 'assigns @collection with a new collection' do
      login(user)
      get :new
      assigns(:collection).should_not eq(nil)
    end

    it 'renders the new page' do
      login(user)
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    context 'vaild collection attributes' do
      it 'creates a collection' do
        login(user)
        collection_attrs = FactoryGirl.attributes_for(:collection)
        expect{
          post :create, collection: FactoryGirl.attributes_for(:collection)
        }.to change(Collection, :count).by(1)
      end
      it 'redirects to collections path' do
        login(user)
        post :create, collection: FactoryGirl.attributes_for(:collection)
        response.should redirect_to home_path
      end
    end
  end

  describe 'GET #show' do
    it 'assigns @collection' do
      login(user)
      get :show, id: user.collections.first
      assigns(:collection).should_not eq(nil)
    end

    it 'assigns @taggable' do
      login(user)
      get :show, id: user.collections.first
      assigns(:taggable).should_not eq(nil)
    end

    it 'assigns @tags' do
      login(user)
      get :show, id: user.collections.first
      assigns(:new_tag).should_not eq(nil)
    end

    it 'assigns @new_tag' do
      login(user)
      get :show, id: user.collections.first
      assigns(:new_tag).should_not eq(nil)
    end

    it 'assigns @commentable' do
      login(user)
      get :show, id: user.collections.first
      assigns(:commentable).should_not eq(nil)
    end

    it 'assigns @new_comment' do
      login(user)
      get :show, id: user.collections.first
      assigns(:new_comment).should_not eq(nil)
    end
  end

  describe 'GET #edit' do

    it 'assigns @collection' do
      login(user)
      get :edit, id: user.collections.first
      assigns(:collection).should_not eq(nil)
    end

    it 'should render the edit page' do
      login(user)
      get :edit, id: user.collections.first
      response.should render_template :edit
    end
  end

  describe 'PUT #update' do
    it 'should allow for update' do
      collection_attributes = FactoryGirl.attributes_for(:collection)
      collection.save!
      put :update, id: collection.id, collection: collection.name = 'Update'
      collection.name.should eq('Update')
    end
    it 'should allow for update' do
      login(user)
      collection_attrs = FactoryGirl.attributes_for(:update_collection)
      put :update, id: collection, collection: collection_attrs
      response.should redirect_to collection_path
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy the user' do
      login(user)
      total = Collection.all.count
      delete :destroy, id: collection.id
      Collection.all.count.should < total
    end
    it 'should redirect to logout' do
      login(user)
      delete :destroy, id: collection.id
      response.should redirect_to home_path
    end
  end

end