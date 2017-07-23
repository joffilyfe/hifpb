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

    resources :semesters, path: 'semestres'
    resources :laboratories, path: 'laboratorios'
    resources :classrooms, path: 'turmas'
    resources :schoolrooms, path: 'salas'
    resources :authorizations, path: 'autorizacoes'

    resources :campus do
      get 'importar', to: 'campus#import', on: :collection
      resources :campus_schedules, only: [:index, :new, :create, :destroy], path: 'horarios'
    end

    resource :courses do
      post 'importar', to: 'courses#import'
    end

    resources :course_subject, only: [:index], path: 'disciplinas' do
      post 'importar', to: 'course_subject#import', on: :collection
    end

    resources :teacher, only: [:index], path: 'professores' do
      post 'importar', to: 'teacher#import', on: :collection
    end
  end
end
