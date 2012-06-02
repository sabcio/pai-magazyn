Magazyn::Application.routes.draw do

  devise_for :users

  resources :users
  resources :products

  namespace :api do
    resources :users, :except => [:new, :edit]
    resources :products, :except => [:new, :edit]
  end

  root :to => "users#index"

end
