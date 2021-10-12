class CocktailsController < ApplicationController

  def index

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.create
    redirect_to cocktail_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def search
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :image, :recipe, :base, :taste, :alcohol_degree, :recommendation)
    params.require(:material).permit(:material, :quantity,)
  end

end
