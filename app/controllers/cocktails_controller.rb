class CocktailsController < ApplicationController
  before_action :authenticate_user!

  MATERIAL_MAX_COUNT = 8

  def index
    @cocktails = Cocktail.all.reverse_order.page(params[:page]).per(5)
    @materials = Material.where(params[:cocktail_id])
  end

  def new
    @cocktail = Cocktail.new
    MATERIAL_MAX_COUNT.times { @cocktail.materials.build } # カクテルと材料を紐付(1:N)
  end

  def create
    @cocktail = current_user.cocktails.build(cocktail_params)  # 投稿ユーザー紐付(new => build)

    # user friendly によせる（材料分量どちらか一方しか入力されていないデータをここで弾く。private以下参照）
    if incomplete_materials.present?
      render :new and return  # 文中でrenderする場合はand returnが必要
    end

    @cocktail.materials = both_filled_materials  # 材料分量両方入力されたデータを代入（private以下参照）
    if @cocktail.valid? && @cocktail.image.attached?  # 先んじてバリデーションの確認 && ActiveStrageのバリデーション代わり
      @cocktail.save
      redirect_to cocktails_path
    else
      @cocktail = current_user.cocktails.build(cocktail_params)
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
    @cocktail.materials.find_by(params[cocktail_id: @cocktail])  # カクテルに紐付いた材料
    (MATERIAL_MAX_COUNT - @cocktail.materials.count).times { @cocktail.materials.build }
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.attributes = cocktail_params  # ".attributes"は、入力されたデータを保存はせず一旦インスタンス格納するメソッド
    
    # user friendly によせる（材料分量どちらか一方しか入力されていないデータをここで弾く。private以下参照）
    if incomplete_materials.present?
      render :edit and return  # 文中でrenderする場合はand returnが必要
    end
    
    @cocktail.materials = both_filled_materials
    if @cocktail.user == current_user && @cocktail.valid?
      @cocktail.save  # 51行目のcocktail_paramsをsaveする(updateではない)
      redirect_to cocktail_path(@cocktail)
    else
      @cocktail = current_user.cocktails.build(cocktail_params)
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.user == current_user
      @cocktail.destroy
      redirect_to cocktails_path
    else
      redirect_to root_path
    end
  end

  def search
    @cocktails = Cocktail.where(['name LIKE(?) or base LIKE(?)', "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(5)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(
      :name, :description, :image, :recipe, :base, :taste, :alcohol_degree, :recommendation, materials_attributes: [:name, :quantity, :id]
    )                                                                                     # form_with親モデル内で、fields_for子モデルを扱う
  end

  def incomplete_materials  # 材料分量どちらか一方が入力されているデータ
    @cocktail.materials - both_filled_materials - empty_filled_materials
  end

  def both_filled_materials  # 材料分量両方入っているデータ
    @cocktail.materials.filter{ |material| material.name.present? && material.quantity.present? }
  end
  
  def empty_filled_materials  # 材料分量両方入っていないデータ
    @cocktail.materials.filter{ |material| !material.name.present? && !material.quantity.present? }
  end

end
