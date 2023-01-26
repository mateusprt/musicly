Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :genres
  resources :artists
  root 'home#index'
  devise_for :users
  get 'home/index'
  get 'dashboard' => 'dashboard#index'
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
