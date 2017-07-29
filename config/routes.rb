Rails.application.routes.draw do

  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'

  if ENV['RAILS_ENV'] == 'test'
    post  :mock_login, to: 'sessions#mock_login'
  end

  # Help to understand routing
  # http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/', to: 'dashboard#index'

    resources :semesters,:except => :show, path: 'semestres'
    resources :laboratories, path: 'laboratorios'
    resources :classrooms, path: 'turmas'
    resources :schoolrooms, path: 'salas'
    resources :authorizations, path: 'autorizacoes'

    resources :user do
      resources :permission
    end

    resources :campus do
      get 'importar', to: 'campus#import', on: :collection
      resources :campus_schedules, only: [:index, :new, :create, :destroy], path: 'horarios'
      get :courses, to: 'courses#index'
    end

    resources :courses do
      post 'importar', to: 'courses#import', on: :collection
      get :course_subject, to: 'course_subject#index', path: 'disciplinas'
      get :classrooms, to: 'classrooms#index', path: 'turmas'
    end

    resources :course_subject, only: [:index], path: 'disciplinas' do
      post 'importar', to: 'course_subject#import', on: :collection
    end

    resources :teacher, only: [:index], path: 'professores' do
      post 'importar', to: 'teacher#import', on: :collection
    end

  end
end
