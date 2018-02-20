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
    resources :projects, only: [:new, :create, :edit, :update, :show, :delete]
  end

  resources :projects do
  	resources :comments
    resources :updates
    get :finish
  end

  get "users/:user_id/projects" => "projects#user_projects"

  get "results" => "projects#results"
  
end
