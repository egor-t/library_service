Rails.application.routes.draw do
  root 'books#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: %i[index show]

  namespace :admin do
    resources :authors
    resources :books
  end
end
