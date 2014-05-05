FailForward::Application.routes.draw do

  root 'homes#show'

  resources :posts, only:[:index]

  match 'auth/:provider', as: 'signin', to: 'sessions#create', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
