Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  get 'home/appoinments'

  get 'locationapp/new'

  get 'locationapp/edit'

  get 'locationapp/show'

  get 'moneyapp/new'

  get 'moneyapp/edit'

  get 'moneyapp/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
