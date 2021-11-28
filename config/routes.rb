Rails.application.routes.draw do
  root to: 'pages#index'

  get '/explore', to: 'sessions#explore'

  devise_for :users
  resources :users

  resources :charges
  resources :sessions
  resources :sessions, module: "sessions" do
    resources :charges
  end
end
