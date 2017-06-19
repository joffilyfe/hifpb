Rails.application.routes.draw do

  # Help to understand routing
  # http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/', to: 'dashboard#index'

    resources :semesters
    resources :classrooms, path: 'turmas'

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
