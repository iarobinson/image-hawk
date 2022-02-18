Rails.application.routes.draw do
  root to: 'pages#index'

  get '/about', to: 'pages#about'
  get '/explore', to: 'sessions#explore'

  devise_for :users
  resources :users

  resources :charges
  resources :sessions
  resources :sessions, module: "sessions" do
    resources :charges do
      get :success, to: 'charges#success'
    end
  end
end
