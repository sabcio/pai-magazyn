Magazyn::Application.routes.draw do

  devise_for :users

  resources :users
  resources :orders
  resources :products

  match "logs" => "logs#show"

  namespace :api do
    resources :users, :except => [:new, :edit]
    resources :products, :except => [:new, :edit]
    resources :orders, only: [:index, :show, :update] do
      resources :products, only: [:index, :show, :update], controller: 'line_items'
    end
  end

  root :to => "users#index"

end
