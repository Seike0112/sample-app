Rails.application.routes.draw do
  root 'static_pages#top'
  
  #ユーザー登録画面
  get '/signup', to: 'users#new'
  
  #ログイン画面
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
end
