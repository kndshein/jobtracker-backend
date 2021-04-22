Rails.application.routes.draw do

  # Authentication-related routes
  post 'login', to: 'authentication#login'
  post 'register', to: 'authentication#register'

  # User-related routes
  get 'profile', to:'users#getProfile'
  put '/profile/update/email', to: 'users#updateEmail'

  # Contact-related routes
  post '/contact/create', to:'contacts#createContact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
