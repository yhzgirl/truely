TruelyIsThatRight::Application.routes.draw do

  get "responses/new"

  resources :questions

  match '/auth/:provider/callback', :to => 'sessions#create' 
  match '/auth/failure', to: redirect('/')
  match '/signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'static_pages#home'
end
