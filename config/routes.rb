Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[new create destroy]
  end
end
