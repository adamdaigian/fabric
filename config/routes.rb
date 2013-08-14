Fabric::Application.routes.draw do
  get "auth/twitter/callback" => 'sessions#create'
  get "signout" => 'sessions#destroy', :as => "signout"

  get "/sentence/:id" => 'sentences#annotate'

  # match 'articles/:url' => 'articles#show'
  resources :articles, only: [:show]
  root :to => 'static_pages#index'
end