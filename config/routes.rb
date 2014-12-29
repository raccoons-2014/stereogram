Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'snippets#index'

  resources :users, only: [:show]
  resources :tracks, only: [:index, :new, :create, :show, :destroy]
  resources :snippets, only: [:index, :show, :create, :destroy]

  post "tracks/upload", :as => :upload
end
