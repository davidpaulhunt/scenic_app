require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #new' do
    it 'assigns @user with a new user' do
      get :new
      assigns(:user).should_not eq(nil)
    end
    it 'renders the new page' do
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    context 'vaild user attributes' do
      it 'creates a new user' do
        user_attrs = FactoryGirl.attributes_for(:user)
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it 'redirects to users path' do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to users_path
      end
    end

    context 'invalid user attributes' do
      it 'does not create a new user with invalid email' do
        post :create, user: FactoryGirl.attributes_for(:no_email_user)
        User.all.count.should eq(0)
      end
      it 'does not create a new user without email' do
        post :create, user: FactoryGirl.attributes_for(:no_email_user)
        User.all.count.should eq(0)
      end
      it 'does not create a new user without accepting terms' do
        post :create, user: FactoryGirl.attributes_for(:decline_terms_user)
        User.all.count.should eq(0)
      end
      it 'does not create a new user if email exists' do
        post :create, user: FactoryGirl.attributes_for(:user)
        post :create, user: FactoryGirl.attributes_for(:user)
        User.all.count.should eq(1)
      end
      it 'does not create a new user if password confirmation doesn\'t match password' do
        post :create, user: FactoryGirl.attributes_for(:no_password_confirmation_user)
        User.all.count.should eq(0)
      end
      it 'renders the new user page' do
        post :create, user: FactoryGirl.attributes_for(:no_email_user)
        response.should render_template :new
      end
    end
  end

  describe 'GET #home' do
    it 'assigns @user with current_user' do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      get :home
      assigns(:user).should_not eq(nil)
    end

    it 'should have collections to display for @user.collections' do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      get :home
      user.collections.count.should eq(3)
    end
  end

  describe 'GET #edit' do
    it 'assigns @user' do
      login(user)
      get :edit, id: user
      assigns(:user).should_not eq(nil)
    end
    it 'should render the edit page' do
      login(user)
      get :edit, id: user
      response.should render_template :edit
    end
  end

  describe 'PUT #update' do
    it 'assigns @user as current_user' do
      login(user)
      get :edit, id: user
      assigns(:user).should_not eq(nil)
    end
    it 'updates the current_user' do
      login(user)
      get :edit, id: user
      put :update, id: user, user: FactoryGirl.attributes_for(:update_user)
      User.last.email.should eq("updated@email.com")
    end
    it 'redirects to home path' do
      login(user)
      put :update, id: user, user: FactoryGirl.attributes_for(:update_user)
      response.should redirect_to home_path
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys current user' do
      login(user)
      delete :destroy, id: user
      User.last.should eq(nil)
    end
    it 'should redirect to logout_path' do
      login(user)
      delete :destroy, id: user
      response.should redirect_to logout_path
    end
  end
end