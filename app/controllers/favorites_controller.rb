class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cocktails = current_user.favorite_cocktails.page(params[:page]).per(5)
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    favorite = current_user.favorites.build(cocktail_id: @cocktail.id)
    favorite.save

    # 通知作成
    @user = @cocktail.user
    if @user != current_user
      @user.notifications.create(
        cocktail_id: @cocktail.id,
        from_user_id: current_user.id,
        variety: 1,
        checked: false  # 明示的に記述ver.1(デフォルトでfalseなので無くてもOK)
      )
      # notification.update_attribute(:checked, false)  #明示的に記述ver.2 #この記述は非同期が出来ない
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    favorite = current_user.favorites.find_by(cocktail_id: @cocktail.id)
    favorite.destroy
  end

end
