class UsersController < ApplicationController
 
  skip_filter :ensure_logged_in, only: [:new, :create, :destroy, :delete]

  def new
    @user = User.new
  end

  def index
  end

  def home
    @user = current_user
    @collection = @user.collections.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to logout_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    if User.find(params[:id]).destroy!
      redirect_to logout_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end

end