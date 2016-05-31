Rails.application.routes.draw do
  resources :list_items
  resources :lists
  resources :cart_items
  resources :items
  resources :carts

  post 'populate_cart', to: 'carts#populate'

  patch 'add_cart_item', to: 'cart_items#add'

  devise_for :users

  authenticated :user do
    root 'lists#index', as: :authenticated_root
  end
  
  root 'welcome#index'
end
