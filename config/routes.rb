Rails.application.routes.draw do
  root 'projects#index'

  resources :rewards
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :updates do
  	resources :comments 
  end

  resources :comments do
  	resources :comments 
  end

  resources :users

  resources :projects do
  	resources :comments
    resources :updates
  end
  
end
