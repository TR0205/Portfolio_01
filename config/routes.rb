# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#login_form'
  get 'about' => 'home#about'
  get 'posts/index' => 'posts#index'
  get 'posts/search' => 'posts#search'
  get 'posts/new' => 'posts#new'

  post 'posts/create' => 'posts＃create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  get 'posts/:id/destroy' => 'posts#destroy'
  patch 'posts/:id/update' => 'posts#update'
  get 'posts/:id' => 'posts#show'



  get 'users/search' => 'users#search'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'

  #get 'users/:id/show_image' => 'users#show_image'

  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'login' => 'users#login_form'
  get 'users/guest_signin' => 'users#new_guest'

  get 'users/:id' => 'users#show'


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
    get :show_image, on: :member
  end
end