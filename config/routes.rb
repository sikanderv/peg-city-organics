Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'products#index'
  post 'products' => 'products#result'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resource :cart, only: [:show]
  # resources :order_items, only: [:create, :update, :destroy], defaults: {formats: 'js'}
  resources :order_items, only: [:create, :update, :destroy]

  resources 'products', only: [:index, :show]

  get '/admin/contact' => 'admin/contact#index', as: "contact"
  get 'pages/contact' => 'pages#contact', as: "user_contact"
  get 'pages/about' => 'pages#about', as: "about"
  get 'products/categorized' => 'products#categorized', as: "categorized_product"
  get 'products/latest' => 'products#latest', as: "latest_product"
  get 'products/sale' => 'products#sale', as: "sale_product"
  get 'products/:id/' => 'products#show', as: "show_product"

end
