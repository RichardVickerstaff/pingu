require "rake/clean"
require 'rake_n_bake'
CLEAN.include "log/**"

Rake::Task["default"].clear

task :default => %i[
  bake:code_quality:all
  bake:code_quality:time_check
  clean
  db:migrate
  db:test:prepare
  docs:generate
  bake:coverage:check_specs
  bake:ok
]

task :ci => %i[
  default
  deploy:edge
  deploy:staging:if_version_changed
]
