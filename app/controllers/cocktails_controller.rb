class CocktailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cocktails = Cocktail.all.reverse_order
    @materials = Material.where(params[:cocktail_id])
  end

  def new
    @cocktail = Cocktail.new
      @cocktail.materials.build  # カクテルと材料を紐付(1:N)
  end

  def create
    @cocktail = current_user.cocktails.build(cocktail_params)  # 投稿ユーザー紐付(new => build)
      if
        @cocktail.save
        redirect_to cocktails_path
      else
        @cocktail.materials.build
        render :new
      end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @user = @cocktail.user
    @materials = @cocktail.materials
    @comment = Comment.new
    @comments = @cocktail.comments
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
      @cocktail.materials.build  # カクテルと材料を紐付(1:N)
  end

  def update
    @cocktail = Cocktail.find(params[:id])
      @cocktail.materials.build
      if
        @cocktail.update(cocktail_params)
        redirect_to cocktail_path(@cocktail)
      else
        @cocktail.materials.build
        render edit
      end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def search
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(
      :name, :description, :image, :recipe, :base, :taste, :alcohol_degree, :recommendation, materials_attributes: [:name, :quantity, :id]
      )                                                                                     # form_with親モデル内で、fields_for子モデルを扱う
  end

end
