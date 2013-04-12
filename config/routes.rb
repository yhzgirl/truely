TruelyIsThatRight::Application.routes.draw do

  resources :responses
  # get "responses/new"
  # post "responses"

  resources :questions

  match '/auth/:provider/callback', :to => 'sessions#create' 
  match '/auth/failure', to: redirect('/')
  match '/signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'static_pages#home'
end
