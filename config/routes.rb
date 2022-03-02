Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  
  get "home/about", to: 'homes#about'
  
  resources :homes, only: [:new]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  
  
end

