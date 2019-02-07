Rails.application.routes.draw do

  get '/', to: 'users#index', as: 'index'
  resources :comments
  resources :gossips
  resources :users
  resources :citys

end
