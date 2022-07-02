Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  match '/404', to: "errors#not_found", via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  root to: 'pages#index'

  get '/about', to: 'pages#about'
  get '/explore', to: 'sessions#explore'
  get '/test-route', to: 'pages#test'
  get '/attributions', to: 'pages#attributions'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users#, except: 'index'

  resources :charges
  resources :sessions
  resources :sessions, module: "sessions" do
    resources :charges do
      get :success, to: 'charges#success'
    end
  end
end
