Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: %i[index show] do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
      patch :update_inline, on: :member
    end
    resources :gists, only: %i[index show create]
    resources :badges, only: %i[index update edit new create destroy]
  end

  resources :feedbacks, only: %i[new create]
  resources :badges, only: %i[index]

  root "tests#index"
end
