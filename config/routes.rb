Rails.application.routes.draw do
  resources :product_instances
  resources :products do
    resources :option_names
  end
  resources :option_values
  resources :categories do
    resources :subcategories
  end
end
