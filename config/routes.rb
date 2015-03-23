Cw2::Application.routes.draw do
  resources :declines

  resources :bookings

  get "static/home"
  get "static/about"
  get "static/dashboard"
  get "static/experts"
  get "static/apply"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root 'static#home'
end
