Rails.application.routes.draw do
  #resources :coupons
  #resources :products
  #resources :product_categories
  #resources :organizations
  #resources :organization_categories
  #resources :clients
  #resources :categories
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "home#index"
  get "/home" => "home#index"
  get "/home/:id" => "home#set_device"
  get "organization/admin" => "organizations#admin"
  get "organization/admin_options" => "organizations#admin_options"
  get "coupon/new" => "coupons#new"
  get "coupon/validate" => "coupons#validate"

  get "/service_worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
end
