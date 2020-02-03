Rails.application.routes.draw do
  
  root to: "posts#index"
  resources :users
  devise_for :users
  resources :posts 

end