Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars do
    resources :bookings, only: :create
  end
  resources :bookings, only: :index
  get "/mycars", to: "cars#my_index"

  get "/bookings/:id/canceled", to: "bookings#canceled", as: :cancel_booking
end
