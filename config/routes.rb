Rails.application.routes.draw do
  
  root 'posts/index'

  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  devise_for :users
 
  resources :posts 

end