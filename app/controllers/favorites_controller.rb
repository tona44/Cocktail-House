class FavoritesController < ApplicationController

  def index
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    favorite = current_user.favorites.build(cocktail_id: @cocktail.id)
    favorite.save
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    favorite = current_user.favorites.find_by(cocktail_id: @cocktail.id)
    favorite.destroy
  end

end
