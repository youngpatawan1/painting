Rails.application.routes.draw do
  resources :users do
    resources :paintings
  end
  
  root 'static_pages#home'
  get 'static_pages/home'
  get 'signup', to: 'users#new'
end
