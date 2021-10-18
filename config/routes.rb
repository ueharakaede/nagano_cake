Rails.application.routes.draw do
  root to: 'public/items#top'

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    password: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admin do
    get 'homes/top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
    resources :order_datails, only: [:update]
  end

  scope module: :public do
    get 'items/about'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all'
    resources :cart_items
    get 'orders/complete'
    resources :orders
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers
    resources :address
  end
end