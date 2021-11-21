Rails.application.routes.draw do
  root to: 'pages#index'

  get '/explore', to: 'sessions#explore'
  get '/send_it', to: 'charges#buy'

  devise_for :users
  resources :users
  resources :sessions do
    get '/charge', to: 'sessions/charges#buy'
  end
end
