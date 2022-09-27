Rails.application.routes.draw do


  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  #test****

  get '/auth/github/callback' => 'access#create'

  #test****


  
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
