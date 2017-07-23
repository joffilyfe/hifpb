if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "required simplecov"
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_as_admin
    user = User.create(registration: ENV['SUAP_USER'], admin: true)
    post login_url({session: {matricula: ENV['SUAP_USER'], password: ENV['SUAP_PASSWORD']}})
  end
end
