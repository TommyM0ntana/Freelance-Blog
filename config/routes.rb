Rails.application.routes.draw do
  root to: "posts#index"
  post 'create_friend' => "friendships#create"
  delete 'remove_friend' => 'friendships#destroy'
  get 'accept_friend_request' => 'friendships#confirm'
  put 'accept_friend_request' => 'friendships#confirm'
  delete 'cancel_friend_request' => 'friendships#cancel'
  delete 'decline_frienship' => 'friendships#destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :friendships, except: [:new, :edit, :show]
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :new, :show, :create] do
  resources :comments, only: [:create]
  resources :likes, only: [:create, :destroy]
  end
end