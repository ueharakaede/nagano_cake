Rails.application.routes.draw do
  devise_for :customer,
  path: :customers,
    :controllers => {
      :registrations => "customer/registrations",
      :sessions => "customer/sessions",
      :passwords => "customer/passwords"
    }

  devise_for :admin,
  path: :admins,
  :controllers => {
    :sessions => "admin/sessions"
  }

  get "/" => "customer/item#top", as: "top"
  get "/about" => "customer/item#about", as: "about"
  get "/customers" => "customer/customers#rule", as: "customer_rule"

  namespace :admin, path: :admins do
    resources :items
    resources :genres
    resources :orders
    resources :orders_datails
    resources :customers
    get "orders/current_user_order/:id" => "orders#current_user_order"
  end

  namespace :customer, path: :customers do
    resources :items
    resources :cart_items
    delete "cart_items" => "cart_items#destroy_all", as: "cart_item_destroy_all"

    resources :orders do
    collection do
      post "confirm"
      get "conplete"
    end
  end
end
end