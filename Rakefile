require "rubygems"
require 'rake'
require 'rake/clean'
require 'rake/rdoctask'
require 'rake/testtask'
require "rake/gempackagetask"
require 'spec/rake/spectask'

PKG_VERSION = "1.2.0"
PKG_NAME = "titlepage"
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"
RUBYFORGE_PROJECT = 'rbook'
RUBYFORGE_USER = 'yob'

CLEAN.include "**/.*.sw*"

desc "Default Task"
task :default => [ :spec ]

desc "Cruise Control Tasks"
task :cruise => [ :spec, :spec_report, :doc ]

# run all rspecs
desc "Run all rspec files"
Spec::Rake::SpecTask.new("spec") do |t|
  t.spec_files = FileList['specs/**/*.rb']
  t.rcov = true
  t.rcov_dir = (ENV['CC_BUILD_ARTIFACTS'] || 'doc') + "/rcov"
  t.rcov_opts = ["--exclude","spec.*\.rb"]
end

# generate specdocs
desc "Generate Specdocs"
Spec::Rake::SpecTask.new("specdocs") do |t|
  t.spec_files = FileList['specs/**/*.rb']
  t.spec_opts = ["--format", "rdoc"]
  t.out = (ENV['CC_BUILD_ARTIFACTS'] || 'doc') + '/specdoc.rd'
end

# generate failing spec report
desc "Generate failing spec report"
Spec::Rake::SpecTask.new("spec_report") do |t|
  t.spec_files = FileList['specs/**/*.rb']
  t.spec_opts = ["--format", "html", "--diff"]
  t.out = (ENV['CC_BUILD_ARTIFACTS'] || 'doc') + '/spec_report.html'
  t.fail_on_error = false
end

# Genereate the RDoc documentation
desc "Create documentation"
Rake::RDocTask.new("doc") do |rdoc|
  rdoc.title = "RBook"
  rdoc.rdoc_dir = (ENV['CC_BUILD_ARTIFACTS'] || 'doc') + '/rdoc'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('COPYING')
  rdoc.rdoc_files.include('LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.options << "--inline-source"
end

spec = Gem::Specification.new do |spec|
  spec.name = PKG_NAME
  spec.version = PKG_VERSION
  spec.platform = Gem::Platform::RUBY
  spec.summary = "A library for using the titlepage.com API"
  spec.files =  Dir.glob("{examples,lib,specs}/**/**/*") + ["Rakefile"]
  spec.require_path = "lib"
  spec.test_files = Dir[ "specs/**/*.rb" ]
  spec.has_rdoc = true
  spec.extra_rdoc_files = %w{README COPYING LICENSE}
  spec.rdoc_options << '--title' << 'titlepage Documentation' << '--main'  << 'README' << '-q'
  spec.add_dependency('rbook-isbn', '>= 1.0')
  spec.add_dependency('andand', '1.3.1')
  spec.add_dependency('troelskn-handsoap', '0.3.6')
  spec.author = "James Healy"
  spec.email = "jimmy@deefa.com"
  spec.rubyforge_project = "rbook"
  spec.homepage = "http://rbook.rubyforge.org/"
  spec.description = "This library is designed to assist with using the titlepage.com SOAP API."
end

desc "Generate a gem for rbook"
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

