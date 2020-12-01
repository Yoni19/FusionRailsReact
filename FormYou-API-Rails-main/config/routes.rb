Rails.application.routes.default_url_options[:host] = 'localhost:3000'


Rails.application.routes.draw do

  resources :formations, only: %w[index show create update destroy]
  resources :categories, only: %w[index show create update destroy]
  resources :rooms, only: %w[index show create destroy]
  resources :sessions, only: %w[index show create update destroy]
  resources :student_sessions, only: %w[index show create update destroy]
  resources :formation_categories, only: %w[create destroy]



  resources :users, only: %w[show]

  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'sessions_devise',
    registrations: 'registrations'
  }
end
