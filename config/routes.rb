Rails.application.routes.draw do
  
  devise_for :users
  root to:"products#index"
  resources :products 
  resources :products do
    resources :destinations, only: [:index, :create]
  end
end
