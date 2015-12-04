Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: {sign_in: 'login', sign_up: 'signup'}
  root 'barbecues#index'

  resources :barbecues, only: [ :index, :show, :new, :create ] do
    resources :items, only: [:create]
  end

  get '/api/barbecues/:id' => 'barbecues#information'
  post '/api/barbecues/:id/join' => 'barbecues#join'
  get '/api/barbecues/:id/guests' => 'barbecues#guests'
  get '/api/barbecues/:id/items' => 'barbecues#items'
  post '/api/barbecues/:id/items' => 'items#create'

end
