Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      # users直下の[:id(PK)]が付与される
      get :followings
      get :followers
    end
    resource :relationships, only: [:create, :destroy]

  end

  get '/users/:user_id/notifications', to: 'notification#index'
  get '/users/:user_id/favorites', to: 'favorites#index'

  resources :cocktails do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]

    collection do
      get :search
    end

  end

  resource :users

end
