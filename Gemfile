source 'https://rubygems.org'


gem 'rails', '4.1.4'
gem 'pg'
gem 'foreigner'
gem 'jbuilder'
gem 'values'
gem 'rake_rack'

group :test, :development do
  gem 'pry-byebug'
  gem 'factory_girl_rails'
  gem 'metric_fu'
  gem 'rspec-rails', '~> 3.0.0' # Rake stats misses specs if this is just in :test
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
  gem 'simplecov'
  gem 'shoulda-matchers'
end
