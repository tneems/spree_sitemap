#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

require 'rake/testtask'
require 'rspec/core/rake_task'
require 'spree/core/testing_support/common_rake'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new

# APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
# load 'rails/tasks/engine.rake'


task :default => :spec

desc "Generates a dummy app for testing"
task :test_app do
  ENV['LIB_NAME'] = 'spree_sitemap'
  Rake::Task['common:test_app'].invoke
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SpreeSitemap'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
