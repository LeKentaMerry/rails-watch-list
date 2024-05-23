Rails.application.routes.draw do
  root to: 'lists#index'
  # # Index
  # get 'lists', to: 'lists#index', as: :lists

  # # Create new list
  # get 'lists/new', to: 'lists#new', as: :new_list
  # post 'lists', to: 'lists#create'

  # # Show
  # get 'lists/:id', to: 'lists#show', as: :list

  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
