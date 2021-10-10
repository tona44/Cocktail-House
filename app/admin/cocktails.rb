ActiveAdmin.register Cocktail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :name, :description, :image, :material, :quantity, :recipe, :base, :taste, :alcohol_degree, :recommendation
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :name, :description, :image, :material, :quantity, :recipe, :base, :taste, :alcohol_degree, :recommendation]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
