Rails.application.routes.draw do

  resources :regions, only: [:index, :show, :create]
  resources :states, only: [:index, :show, :create]
  resources :cities, only: [:index, :show, :create]

end
