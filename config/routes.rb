Rails.application.routes.draw do
  devise_for :users
  resources :notifications
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :folders do
    resources :sections, only: [:create, :new]
  end
  resources :sections, only: [:destroy, :update] do
    resources :tasks, only: [:index, :create, :new]
    resources :timers, only: [:create, :new]
    resources :webs, only: [:create, :new]
  end
  resources :bookmark_lists, only: [:show, :create, :new, :destroy, :edit, :update] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: [:destroy]
  resources :tasks, only: [:destroy, :edit, :update]
  resources :timers, only: [:destroy, :edit, :update]

  root to: "folders#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
