Family::Application.routes.draw do

  namespace :admin do
  resources :users
 end
  devise_for :users
  devise_for :doctors
  devise_for :patients
  devise_for :admin
 
 ###### Main Routes #######
  
  resources :users
  resources :home
  resources :patients
  resources :patient_images
  resources :appointments
  resources :uploads
  resources :doctors
  resources :accounts
 
  match "/users/sign_out" => "devise/sessions#destroy"
  match "/all_accounts" => "accounts#all_accounts"
  match "/patient_details/:id" => "patients#patient_details"
  
  match '/create_master_account' => 'users#create_master_account'
  match '/appointment_approve/:id' => 'appointments#appointment_approve', :as => :appointment_approve
  
  match '/admin' => 'home#admin', :as => :admin
  match '/staff' => 'home#staff', :as => :staff
  match '/company' => 'home#company', :as => :company
  match '/download/:id' => 'uploads#download', :as => :download 


  # Redirection after sign_up page
  namespace :user do
    root :to => "home#index"
  end
  
  # default root file
  root :to => "home#index"  

end