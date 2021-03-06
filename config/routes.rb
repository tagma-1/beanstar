Rails.application.routes.draw do

  root "pages#home"
  
  resources :profiles
  resources :listings
  post 'stores/following' => 'followers#create'
  delete 'stores/following' => 'followers#destroy'
  resources :stores
  resources :reviews

  get '/search' => 'results#index' 
  
  resources :conversations do
    resources :messages
  end
  
  resources :purchases, only: [:index, :show, :new, :create]

  #Devise controllers have been generated to allow for custom re-direction to create a profile on sign up. 

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
end
