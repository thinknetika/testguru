Rails.application.routes.draw do
  root "tests#index"

  resources :supports, only: %i[new create]

  resources :badges, only: :index

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: "sessions" }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    resources :gists, only: :create
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: %i[index]
    resources :badges do
      get :options, on: :collection
    end
  end
end
