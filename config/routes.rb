Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'snippets#index'

  resources :users do
    get 'following','followers', on: :member
  end
  resources :tracks, only: [:index, :new, :create, :show, :destroy]
  resources :snippets, only: [:index, :show, :create, :destroy]

  post "tracks/upload", :as => :upload
end
