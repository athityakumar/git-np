require 'bundler/setup'
require 'rubygems/tasks'
Gem::Tasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require 'rubocop/rake_task'
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

require 'ruumba/rake_task'
Ruumba::RakeTask.new do |task|
  task.dir = %w[lib/templates]
end

task default: %w[spec rubocop ruumba]
