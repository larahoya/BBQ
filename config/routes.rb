Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: {sign_in: 'login', sign_up: 'signup'}
  root 'barbecues#index'

  resources :barbecues, only: [ :index, :show, :new, :create ]
end
