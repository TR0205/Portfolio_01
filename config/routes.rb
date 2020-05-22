Rails.application.routes.draw do
  get "top" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "login" => "user#login_form"

  get "about" => "home#about"

  get "posts/new" => "posts#new"

  get "users/show" => "users#show"

  get "bookmark" => "users#like"
end
