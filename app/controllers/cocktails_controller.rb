class CocktailsController < ApplicationController

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def search
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :image, :material, :quantity, :recipe, :base, :taste, :alcohol_degree, :recommendation)
  end

end
