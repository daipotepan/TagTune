require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'capybara/rspec'
require 'capybara/rails'
require 'warden'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # FactoryBot
  config.include FactoryBot::Syntax::Methods

  # Devise
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.include Warden::Test::Helpers, type: :system

  config.after(type: :system) do
    Warden.test_reset!
  end

  config.before(type: :system) do
    driven_by(:rack_test)
  end

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end