Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  root 'books#top'
  get "home/about" => "home/about"
  resources :users, :only => [:show, :index, :edit, :update]
  resources :books, :only => [:show, :new, :create, :index, :edit, :update, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
