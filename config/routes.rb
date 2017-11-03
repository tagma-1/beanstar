Rails.application.routes.draw do
  resources :stores
  root "pages#home"
  
  #Devise controllers have been generated to allow for custom re-direction to create a profile on sign up. 

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :profiles
end
