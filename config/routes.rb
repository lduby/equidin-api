Rails.application.routes.draw do
  

  #mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'User', at: 'auth',:controllers => { :omniauth_callbacks => 'omniauth' }, via: [:get, :post]
  # devise_for :users
  
  #resources :profiles
  # get 'profiles/show'
  get "profiles/:id", to: "profiles#find_user_profile"
  post "profiles", to: "profiles#create"
  put "profiles/:id", to: "profiles#update"
end
