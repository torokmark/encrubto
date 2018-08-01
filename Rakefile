require "bundler/gem_tasks"
require "rspec/core/rake_task"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "encrubto/version"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :build do
  system "gem build encrubto.gemspec"
end

task :install do
  system "gem install encrubto-#{ Encrubto::VERSION }.gem"
end

task :push do
  system "gem push encrubto-#{ Encrubto::VERSION }.gem"
end

task :exec do
  system './bin/encrubto'
end

task :full => [:build, :install, :spec, :exec]
