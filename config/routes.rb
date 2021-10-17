Rails.application.routes.draw do

  devise_for :admins, controllers: {
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords',
    :registrations => 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    get 'top' => 'items#top'
    resources :orders_datails, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  root to: "items#top"
  get 'about' => 'items#about'
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

    resources :orders, only: [:new, :index, :show, :create] do
    collection do
      post 'confirm'
      get 'conplete'
      get 'thanks'
    end
  end
end