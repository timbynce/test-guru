# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index' 

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }

  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
      post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    
    resources :tests do
      resources :questions, except: [:index], shallow: true do
        resources :answers, except: [:index], shallow: true
      end
    end
  end

end
