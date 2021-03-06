require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  unless defined?(Rails)
    require File.expand_path("../../config/environment", __FILE__)
  end
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    ActiveSupport::Dependencies.clear
    def test_sign_in(user)
      controller.sign_in(user)
    end
  end
end

Spork.each_run do
end
