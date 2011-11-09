Family::Application.routes.draw do

  devise_for :users
  devise_for :doctors
  devise_for :patients
  #devise_for :admin  
  #devise_for :companies 
 
 
 ###### Main Routes #######
  
  resources :users
  resources :home
  resources :patients
  resources :patient_images
  resources :appointments
  resources :uploads
 
  match '/doctors' => 'home#doctors', :as => :doctors
  match '/admin' => 'home#admin', :as => :admin
  match '/staff' => 'home#staff', :as => :staff
  match '/company' => 'home#company', :as => :company


  # Redirection after sign_up page
  namespace :user do
    root :to => "home#index"
  end
  
  # default root file
  root :to => "home#index"  

end