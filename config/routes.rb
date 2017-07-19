Rails.application.routes.draw do


  root 'home#index'
  get 'home/index'

  # showMyPage 최혁 추가 부분
  get 'home/showMyPage'

  get 'home/appointments'

  resources :location_apps, except: :index
  resources :money_apps, except: :index

  post 'invite/money_done' => 'invite#money_done'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
