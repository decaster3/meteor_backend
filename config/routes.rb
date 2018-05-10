Rails.application.routes.draw do
  resources :addresses
  resources :cities
  resources :countries
  resources :products do
    resources :product_instances do
      resources :option_values
    end
    resources :option_names
  end
  resources :categories do
    resources :subcategories
  end
end
