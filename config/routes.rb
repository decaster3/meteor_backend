Rails.application.routes.draw do
  resources :countries do
    resources :cities
  end

  resources :products do
    resources :product_instances, :option_names
  end

  resources :categories do
    resources :subcategories
  end

  resources :users
  
  devise_for :users,
             path: 'auth',
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             },
             defaults: {
               format: :json
             }

  # Required by Devise
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
