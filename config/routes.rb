# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#login_form'
  get 'about' => 'home#about'

  get 'posts/search' => 'posts#search'
  get 'posts/new' => 'posts#new'

  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts＃create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  get 'posts/:id/destroy' => 'posts#destroy'

  get 'users/search' => 'users#search'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'login' => 'users#login_form'
  get 'users/guest_signin' => 'users#new_guest'

  get 'likes/:post_id/create' => 'likes#create'
  get 'likes/:post_id/destroy' => 'likes#destroy'
  get 'likes/:post_id/create_index' => 'likes#create_index'
  get 'likes/:post_id/destroy_index' => 'likes#destroy_index'
  get 'users/:id/likes' => 'users#likes'

  get 'try' => 'posts#try'

  resources :users do
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end