Rails.application.routes.draw do
  # get 'posts/index'
  resources :posts

  root to: "posts#index"
end
