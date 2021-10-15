Rails.application.routes.draw do

  devise_for :admin,
  path: :admins,
  :controllers => {
    :sessions => "admin/sessions"
  }

  namespace :admin, path: :admins do
    resources :items
    resources :genres
    resources :orders
    resources :orders_datails
    resources :customers
    get "orders/current_user_order/:id" => "orders#current_user_order"
  end

    resources :orders do
    collection do
      post "confirm"
      get "conplete"
    end
  end
end