Rails.application.routes.draw do
  get "about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "login" => "users#login_form"

  get "posts/new" => "posts#new"
  get "/" => "posts#index"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/create" => "posts＃create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"


  get "users/show" => "users#show"
  get "signup" => "users#new"
  get "bookmark" => "users#like"
end
