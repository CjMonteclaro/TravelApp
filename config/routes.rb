Rails.application.routes.draw do
  get 'checkout/success'

  get 'checkout/failure'

  get 'checkout/cancelled'

  resources :roles
  resources :profiles
  resources :policies
  resources :travellers do
    collection { post :add }
  end
  resources :travel_destinations
  resources :countries
  resources :quotes do
    member { get :paymaya_checkout }
  end
  resources :benefit_limits
  resources :benefits
  resources :benefit_categories
  resources :traveller_types
  resources :travel_prems
  resources :travel_periods
  resources :destination_classes

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users

  root to: "quotes#new"
end
