Magazyn::Application.routes.draw do

  resources :users

  namespace :api do
    resources :users, :except => [:new, :edit]
  end

  root :to => "users#index"

end
