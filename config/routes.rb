Rails.application.routes.draw do
  resources :product_instances
  resources :products
  resources :option_values
  resources :option_names
  resources :categories do
    resources :subcategories
  end
end
