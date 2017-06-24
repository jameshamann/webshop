Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :charges

  root "application#index"
  resources :items
     devise_for :users, controllers: {
       sessions: 'users/sessions',
       passwords: 'users/passwords',
       registrations: 'users/registrations'
     }
end
