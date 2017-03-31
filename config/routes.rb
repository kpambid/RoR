Rails.application.routes.draw do
  #  root to: "devise/sessions#create"
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  devise_for :hosts, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  #devise_for :hosts, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  #devise_for :hosts, :controllers => { :registration => "registration",
  #  :omniauth_callbacks => "omniauth_callbacks" }

  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hosts do
    resources :accomodations do
      resources :accomodation_photos
    end
  end

  require "resque_web"
    mount ResqueWeb::Engine => "/resque_web"
end
