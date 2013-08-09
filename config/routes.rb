Fabric::Application.routes.draw do
  get "auth/twitter/callback" => 'sessions#create'
  get "signout" => 'sessions#destroy', :as => "signout"

  root :to => 'static_pages#index'
end
