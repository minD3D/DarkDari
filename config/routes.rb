Rails.application.routes.draw do


  root 'home#index'
  get 'home/index'

  get 'home/appointments'

  resources :location_apps, except: :index
  resources :money_apps, except: :index

  resources :money_infos, only: :update

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
