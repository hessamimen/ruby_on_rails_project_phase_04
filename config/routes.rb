Rails.application.routes.draw do

  root 'access#menu'
  
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  #test****

  get '/auth/github/callback' => 'access#create'

  #test****

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
 
  
  resources :clients do 
    member do
      get :delete
    end
  end
  resources :trainers do 
    member do
      get :delete
    end
  end
  resources :feedbacks do
    member do
      get :delete
    end
  end
  resources :appointments do 
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
