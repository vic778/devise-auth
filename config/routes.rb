Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { confirmations: 'users/confirmations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root "home#index"
 resources :users

end
