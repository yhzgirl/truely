TruelyIsThatRight::Application.routes.draw do

  resources :questions

  root :to => 'static_pages#home'
end
