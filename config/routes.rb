Cw2::Application.routes.draw do
  resources :declines

  resources :bookings do
    collection do
      get :apply
      get :finishregistration #user inputs card
      post :inputcard #anytime you submit a form its a post request.
    end
    member do #member passes id
      get :makeexpert
      get :revokeexpert
      get :accepttime1
      get :accepttime2
      get :accepttime3 
      get :room
    end
  end

  resources :declines do
    member do
      get :declineuser
    end
  end

  get "static/home"
  get "static/about"
  get "static/dashboard"
  get "static/experts"
  get "static/apply"

  get "bookings/finishregistration"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root 'static#home'
end
