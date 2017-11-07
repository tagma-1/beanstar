Rails.application.routes.draw do

  root "pages#home"
  
  resources :profiles
  resources :listings
  resources :stores
  
  resources :conversations do
    resources :messages
  end
  
  resources :purchases, only: [:index, :show, :new, :create]
  
  # Routes for generating emails following a successful transaction
  get '/transaction' => 'transaction#new'
  post '/transaction' => 'transaction#create'
  
  
  #Devise controllers have been generated to allow for custom re-direction to create a profile on sign up. 

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
end
