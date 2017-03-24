Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hosts do
    resources :accomodations do
      resources :accomodation_photos
    end
  end
end
