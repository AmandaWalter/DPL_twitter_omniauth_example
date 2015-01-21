Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :index]
  resources :posts, except: [:show, :index]

  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: :about
end
