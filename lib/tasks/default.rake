require "rake/clean"
require 'rake_rack'
CLEAN.include "log/**"

Rake::Task["default"].clear

task :default => %i[
  rake_rack:code_quality:all
  rake_rack:code_quality:time_check
  clean
  db:migrate
  db:test:prepare
  rake_rack:rspec
  rake_rack:coverage:check_specs
  rake_rack:ok
]

task :ci => %i[
  default
  deploy:edge
  deploy:staging:if_version_changed
]
