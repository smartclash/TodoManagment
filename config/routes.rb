Rails.application.routes.draw do
  get '/', to: 'home#index', as: :home

  resources :todos
  resources :users
  resources :sessions
end
