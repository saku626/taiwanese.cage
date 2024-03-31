Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static_pages#top"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[new create]
  resources :requests, only: %i[index]
  resources :bookmarks, only: %i[index create destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
