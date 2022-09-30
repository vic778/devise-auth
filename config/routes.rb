Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'users', to: 'users#index'

end
