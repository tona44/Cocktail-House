class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @cocktails = @user.cocktails
  end

  def edit
    @user = User.find(params[:id]) if @user == current_user
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
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
