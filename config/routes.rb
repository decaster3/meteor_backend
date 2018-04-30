Rails.application.routes.draw do
  resources :product_options
  resources :option_category_options
  resources :option_categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
