Rails.application.routes.draw do
  # Authentication-related routes
  post 'login', to: 'authentication#login'
  post 'register', to: 'authentication#register'

  # User-related routes
  get 'profile', to:'users#getProfile'
  put '/profile/update/email', to: 'users#updateEmail'

  # Contact-related routes
  post '/contact/create', to:'contacts#createContact'
  put '/contact/:id', to:'contacts#updateContact'
  delete '/contact/:id', to: 'contacts#deleteContact'

  # Job-related routes
  post '/job/create', to:'jobs#createJob'
  put '/job/:id', to:'jobs#updateJob'
  delete '/job/:id', to: 'jobs#deleteJob'

  # Interview-related routes
  post '/job/:id/interview/', to:'time_interviews#createInterview'
  put 'interview/:id', to:'time_interviews#updateInterview'
  delete 'interview/:id', to:'time_interviews#deleteInterview'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
