Rails.application.routes.draw do
  scope 'api', :format => :json do
    get '/pay', to: 'pay#epay'
    post '/pay/process', to: 'pay#process_payment'
    resources :promotions
    resources :orders

    resources :countries
    resources :cities

    resources :products do
      resources :product_instances
    end

    resources :categories do
      resources :subcategories
    end

    resources :users, only: [:index, :show]

    get 'confirmation', to: 'confirmations#show'

    devise_for :users, path: 'auth', controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}, defaults: {format: :json}

    # Required by Devise
    root to: 'home#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
