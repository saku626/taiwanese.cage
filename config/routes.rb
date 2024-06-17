Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static_pages#top"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[new create]
  resources :requests, only: %i[index show]
  resources :bookmarks, only: %i[index create destroy]
  resources :vocabularies, only: %i[show new create edit update destroy]
  resources :tasks, only: %i[index]
  resources :password_resets, only: %i[new create edit update]
  
  resources :categories, only: [:new, :create, :destroy] do
    get :delete_confirm, on: :collection
  end

  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
