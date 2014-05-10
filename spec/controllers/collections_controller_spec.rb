require 'spec_helper'

describe CollectionsController do

  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #new' do

    it 'assigns @collection with a new collection' do
      get :new
      assigns(:collection).should_not eq(nil)
    end

    it 'renders the new page' do
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    context 'vaild collection attributes' do
      it 'creates a collection' do
        collection_attrs = FactoryGirl.attributes_for(:collection)
        expect{
          post :create, collection: FactoryGirl.attributes_for(:collection)
        }.to change(Collection, :count).by(1)
      end
      it 'redirects to collections path' do
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
      assigns(:tag).should_not eq(nil)
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
end