Rails.application.routes.draw do
  resources :educationals
  resources :degrees
  resources :universities
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  root :to => "main#home_page"

  devise_for :users
  resources :stipends
  resources :sponsords
  resources :categories
  resources :students

  # => Student Movement
  get '/registered_students', to: 'student_movement#registered_students', as: 'registered_students'
  get '/update_status/:id', to: 'student_movement#update_status', as: 'update_status'
  get '/students_stipend', to: 'student_movement#students_stipend', as: 'students_stipend'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
