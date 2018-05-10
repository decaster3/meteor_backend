Rails.application.routes.draw do
  resources :countries do
    resources :cities
  end

  resources :products do
    resources :product_instances do
      resources :option_values
    end
    resources :option_names
  end

  resources :categories do
    resources :subcategories
    resources :toppings
  end

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             },
             defaults: {
                 format: :json
             }

  # resources :users

  # Required by Devise
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
