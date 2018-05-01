Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Required by Devise
  root to: 'home#index'
end
