Rails.application.routes.draw do
  resources :orders

  resources :countries do
    resources :cities
  end

  resources :products do
    resources :product_instances
    resources :option_names
  end

  resources :categories do
    resources :subcategories
  end

  resources :users, only: [:index, :show]

  devise_for :users, path: 'auth', controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }, defaults: {format: :json}

  # Required by Devise
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
