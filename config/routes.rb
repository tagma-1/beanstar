Rails.application.routes.draw do
  root "pages#home"
  
  resources :profiles
  resources :listings
  resources :stores
  
  resources :conversations do
    resources :messages
  end
  
  
  #Devise controllers have been generated to allow for custom re-direction to create a profile on sign up. 

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
end
