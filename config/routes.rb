Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # /restaurants/top
  # /restaurants/:id/chef
  # /restaurants/:id/reviews/new

  resources :restaurants do
    collection do
      # anything that goes in here is PREFIXED by /restaurants
      # get :whatever #=> /restaurants/whatever
      get :top #=> /restaurants/top
    end

    member do
      # anything that goes in here is PREFIXED by /restaurants/:id
      # get :whatever #=> /restaurants/:id/whatever
      get :chef_name
    end

    # WE ONLY NEST RESOURCES IF WE NEED TO KNOW
    # THE ID OF THE PARENT!
    resources :reviews, only: [:new, :create]
    # new is to get the form
    # create is to receive the form
  end

  resources :reviews, only: [:destroy]



  # resources :restaurants, only: [:index, :new, :create]
  # you go to the controller
  # create the index action
  # you go to the view
  # create the index.html.erb
  # AND YOU TEST!!
  # YOU SEE ALL THE RESTAURANTS

end
