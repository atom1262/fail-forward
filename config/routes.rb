FailForward::Application.routes.draw do

  root 'homes#show'

  resources :users, only: [:show]

  resources :industries, only: [:show, :index]

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create]
    resources :improvements, only: [:new, :create]
    member do
      post "subscribe" => "subscriptions#create"
      delete "unsubscribe" => "subscriptions#destroy"
    end
  end

  match 'auth/:provider', as: 'signin', to: 'sessions#create', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
