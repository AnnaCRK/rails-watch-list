Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "lists#index"
  
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
end


#   root "lists#index"
#   get "lists/new", to: "lists#new"
#   get "bookmarks/new", to: "bookmarks#new"
#   get "lists/:id", to: "lists#show"

#   post "lists", to: "lists#create"
#   post "bookmarks", to: "bookmarks#create"
#   # resources :lists, only: [:index]
#   # resources :bookmarks, only: [:]

# end

# resources :restaurants do
#   resources :reviews, only: [:new, :create]
