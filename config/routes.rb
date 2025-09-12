Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: [:index, :show] do
    post :start, on: :member

    resources :questions, only: [:show], shallow: true do
      resources :answers, only: [:show], shallow: true
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

  root "tests#index"
end
