Rails.application.routes.draw do
  get "about" => "home#about"

  get "posts/new" => "posts#new"
  get "/" => "posts#index"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts＃create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"

  get "bookmark" => "users#like"
end
