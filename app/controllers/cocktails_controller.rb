class CocktailsController < ApplicationController

  def index

  end

  def new
    @cocktail = Cocktail.new
    @cocktail.materials.build  # カクテルと材料を紐付(1:N)
  end

  def create
    @cocktail = current_user.cocktails.build(cocktail_params)  # 投稿ユーザー紐付(new => build)
    @cocktail.save
    redirect_to cocktails_path
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
    params.require(:cocktail).permit(
      :name, :description, :image, :recipe, :base, :taste, :alcohol_degree, :recommendation, materials_attributes: [:name, :quantity, :cocktail_id]
      )                                                                                     # form_with親モデル内で、fields_for子モデルを扱う
  end

end
