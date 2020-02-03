Rails.application.routes.draw do
  get 'posts/index,'
  get 'posts/new'
  get 'posts/show'
  get 'posts/create'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  devise_for :users
end
