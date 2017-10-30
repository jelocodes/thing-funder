Rails.application.routes.draw do
  root 'projects#index'

  resources :rewards
  devise_for :users

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
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
