Rails.application.routes.draw do
  root to: 'pages#index'

  get '/explore', to: 'sessions#explore'
  get '/send_it', to: 'charges#buy'

  devise_for :users

  get '/orders', to: 'orders#index'
  post '/orders/submit', to: 'orders#submit'

  resources :users
  resources :sessions
  resources :sessions, module: "sessions" do
    resources :charges
  end
end
