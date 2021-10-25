class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @cocktails = @user.cocktails.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(user_params)
      redirect_to user_path
    else
      render root_path
    end
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(5)
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(5)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image])
  # end

end
