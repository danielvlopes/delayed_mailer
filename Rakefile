# coding: utf-8
require 'rake'
require 'rake/rdoctask'

begin
  require 'spec/rake/spectask'
rescue LoadError
  begin
    gem 'rspec-rails', '>= 1.0.0'
    require 'spec/rake/spectask'
  rescue LoadError
    puts "RSpec - or one of it's dependencies - is not available. Install it with: sudo gem install rspec-rails"
  end
end

NAME = "delayed_mailer"
SUMMARY = %Q{Send emails asynchronously using delayed_job.}
HOMEPAGE = "http://github.com/danielvlopes/#{NAME}"
AUTHOR = "Anderson Dias"
EMAIL = "andersondaraujo@gmail.com"
SUPPORT_FILES = %w(README)

begin
  gem 'jeweler', '>= 1.2.1'
  require 'jeweler'
  
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = NAME
    gemspec.summary = SUMMARY
    gemspec.description = SUMMARY
    gemspec.homepage = HOMEPAGE
    gemspec.author = AUTHOR
    gemspec.email = EMAIL
    
    gemspec.autorequire = NAME
    gemspec.require_paths = %w{lib}
    gemspec.files = SUPPORT_FILES << %w(MIT-LICENSE Rakefile) << Dir.glob(File.join(*%w[{lib,spec} ** *]).to_s)
    gemspec.extra_rdoc_files = SUPPORT_FILES
    
    gemspec.add_dependency 'actionmailer', '>= 1.2.3'
    gemspec.add_dependency 'activesupport', '>= 1.2.3'
    
    gemspec.add_development_dependency 'rspec-rails', '>= 1.2.6'
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install jeweler -s http://gemcutter.org"
end

desc %Q{Default: Run specs for "#{NAME}".}
task :default => :spec

desc %Q{Generate documentation for "#{NAME}".}
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = NAME
  rdoc.options << '--line-numbers' << '--inline-source' << '--charset=UTF-8'
  rdoc.rdoc_files.include(SUPPORT_FILES)
  rdoc.rdoc_files.include(File.join(*%w[lib ** *.rb]))
end

SPEC_FILES = Rake::FileList[File.join(*%w[spec ** *_spec.rb])]

if defined?(Spec)
  desc %Q{Run specs for "#{NAME}".}
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = SPEC_FILES
    t.spec_opts = ['-c']
  end

  desc %Q{Generate code coverage for "#{NAME}".}
  Spec::Rake::SpecTask.new(:coverage) do |t|
    t.spec_files = SPEC_FILES
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec,/var/lib/gems']
  end
end
