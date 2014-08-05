source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'

gem "apitome", git: 'https://github.com/modeset/apitome'
gem 'foreigner'
gem 'jbuilder'
gem 'rake_rack'
gem 'values'
gem 'rabl'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'metric_fu'
  gem 'pry-byebug'
  gem 'rspec_api_documentation'
  gem 'rspec-rails', '~> 3.0.0' # Rake stats misses specs if this is just in :test
  gem 'rubocop'
end

group :development do
  gem 'flamegraph'
  gem 'immigrant'
  gem 'meta_request'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov'
end
