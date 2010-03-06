# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{delayed_mailer}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anderson Ara\303\272jo"]
  s.date = %q{2010-03-05}
  s.description = %q{Send emails asynchronously using delayed_job.}
  s.email = %q{andersondaraujo@gmail.com}
  s.files = [
    ".gitignore",
     "Rakefile",
     "VERSION",
     "delayed_mailer.gemspec",
     "lib/delayed/mailer.rb",
     "lib/delayed_mailer.rb",
     "spec/delayed_mailer_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/danielvlopes/delayed_mailer}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Send emails asynchronously using delayed_job.}
  s.test_files = [
    "spec/delayed_mailer_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

