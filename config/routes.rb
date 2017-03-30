Rails.application.routes.draw do

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/admin/contact' => 'admin/contact#index', as: "contact"
  get 'pages/contact' => 'pages#contact', as: "user_contact"
  get 'pages/about' => 'pages#about', as: "about"
end
