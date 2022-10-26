Rails.application.routes.draw do
  root 'pages#home'
  
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  controller: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  
 #get '/users/:id', to: 'users/show'
 resources :users, only: [:show]

 resources :posts, only: [:index, :show, :create] do
  resources :photos, only: [:create]
 end

end
