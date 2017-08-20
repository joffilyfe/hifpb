Rails.application.routes.draw do

  root to: 'site#index'

  get :set_campi, to: 'site#set_campi', path: :campi

  namespace :schedule, path: 'horarios' do
    match :courses, to: 'course#index', via: [:get, :post], path: :cursos
    get :course, to: 'course#show', path: :curso
    match :laboratories, to: 'laboratory#index', via: [:get, :post], path: :laboratorios
    get :laboratory, to: 'laboratory#show', path: :laboratorio
    match :schoolrooms, to: 'schoolroom#index', via: [:get, :post], path: :salas
    get :schoolroom, to: 'schoolroom#show', path: :sala
    match :teachers, to: 'teacher#index', via: [:get, :post], path: :professores
    get :teacher, to: 'teacher#show', path: :professor

  end

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
    resources :schoolrooms, path: 'salas'
    resources :authorizations, path: 'autorizacoes'
    resources :classrooms, path:'turmas' do
      resources :lessons,  path: 'aulas'
    end

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

    scope :relatorios do
      get '/', to: 'reports#index', as: 'reports'
      get '/professores',  to: 'reports#professores', as: 'reports_teachers'
      get '/professor/:id',  to: 'reports#professor', as: 'report_teacher'
      get '/salas',  to: 'reports#salas', as: 'reports_schoolrooms'
      get '/sala/:id',  to: 'reports#sala', as: 'report_schoolroom'
      get '/laboratorios',  to: 'reports#laboratorios', as: 'reports_laboratories'
      get '/laboratorio/:id',  to: 'reports#laboratorio', as: 'report_laboratory'
    end
  end
end
