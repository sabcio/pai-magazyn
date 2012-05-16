Magazyn::Application.routes.draw do

  resources :users
  resources :products

  namespace :api do
    resources :users, :except => [:new, :edit]
    resources :products, :except => [:new, :edit]
  end

  root :to => "users#index"

end
