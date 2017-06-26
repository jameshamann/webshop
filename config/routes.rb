Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :charges

  get 'thanks', to: 'charges#thanks', as: 'thanks'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root "application#index"
  resources :items
     devise_for :users, controllers: {
       sessions: 'users/sessions',
       passwords: 'users/passwords',
       registrations: 'users/registrations'
     }
end
