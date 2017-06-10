Rails.application.routes.draw do

  # Help to understand routing
  # http://guides.rubyonrails.org/routing.html

  namespace :admin do
    scope '/importar' do
      get 'campus', to: 'import#campus', as: 'importar_campus'
    end
  end
end
