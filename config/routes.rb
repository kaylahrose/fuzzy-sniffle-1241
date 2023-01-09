Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dish, only: [:show]
  resources :chef, only: [:show] do
    resources :dish, only: [:create]
  end
end
