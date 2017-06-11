Rails.application.routes.draw do

  # Help to understand routing
  # http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/', to: 'dashboard#index'

    scope '/importar' do
      get 'campus', to: 'import#campus', as: 'importar_campus'
      get 'cursos/:id_campus/:ano_letivo/:periodo_letivo', to: 'import#courses', as: 'importar_courses'
    end
  end
end
