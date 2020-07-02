Rails.application.routes.draw do
  get 'users/new'
  root to: 'users#new'
  resources :tasks
  resources :users
  resources :sessions

  namespace :admin do
   resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
