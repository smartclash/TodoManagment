Rails.application.routes.draw do
  get '/', to: 'home#index', as: :home
  post 'users/login', to: 'users#login'

  resources :todos
  resources :users
end
