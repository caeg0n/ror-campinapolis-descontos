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
  get "organization/admin" => "organizations#admin"
  get "organization/admin_options" => "organizations#admin_options"
  get "coupon/new" => "coupons#new"
end
