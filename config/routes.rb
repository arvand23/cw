Cw2::Application.routes.draw do
  get "static/home"
  get "static/about"
  get "static/dashboard"
  get "static/experts"
  get "static/apply"

  root 'static#home'
end
