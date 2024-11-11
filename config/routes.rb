Rails.application.routes.draw do
  root "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
