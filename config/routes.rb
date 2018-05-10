Rails.application.routes.draw do
  resources :orders
  resources :addresses
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
end
