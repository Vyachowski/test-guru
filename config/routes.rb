Rails.application.routes.draw do
  get :login, to: "sessions#new"
  delete :logout, to: "sessions#destroy"
  get :signup, to: "users#new"

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  root "tests#index"
end
