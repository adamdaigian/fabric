Fabric::Application.routes.draw do
  get "auth/twitter/callback" => 'sessions#create'
  get "signout" => 'sessions#destroy', :as => "signout"
  match "home" => "static_pages#home", as:"home"

  get "/sentence/:id" => 'sentences#annotate'
  get "/addAnnotation/:sentence_id/:content" => 'sentences#addAnnotation'

  # match 'articles/:url' => 'articles#show'
  resources :articles, only: [:show]
  root :to => 'static_pages#index'
end