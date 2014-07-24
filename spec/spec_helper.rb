require 'simplecov'

SimpleCov.start 'rails' do
  coverage_dir 'log/coverage/spec'
  add_filter 'factories'
end

RSpec.configure do |config|
  config.deprecation_stream = 'log/rspec.log'
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end
end
