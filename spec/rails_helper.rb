ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec-deep-ignore-order-matcher'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.include Requests::JsonHelpers
  config.include Rack::Test::Methods

  config.infer_spec_type_from_file_location!

  config.render_views
end

RspecApiDocumentation.configure do |config|
  config.format = :json
end
