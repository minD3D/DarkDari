Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  root 'home#index'
  get 'home/index'

  # showMyPage 최혁 추가 부분
  get 'home/show_my_page'

  get 'home/appointments'

  resources :appointments, except: :index

  resources :infos, only: :create do
    member do
      patch 'done'
      post 'change_money'
    end
  end



  resources :notifications, only: [:create, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
