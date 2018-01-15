Rails.application.routes.draw do
  root 'projects#index'

  resources :rewards
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :updates do
  	resources :comments 
  end

  resources :comments do
  	resources :comments 
  end

  resources :users do 
    resources :projects
  end

  resources :projects do
  	resources :comments
    resources :updates
    get :finish
  end

  get 'user_projects', :to => 'projects#user_projects'
  
end
