Rails.application.routes.draw do
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
