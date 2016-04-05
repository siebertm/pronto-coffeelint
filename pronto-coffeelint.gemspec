# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pronto/coffeelint/version'

Gem::Specification.new do |s|
  s.name = 'pronto-coffeelint'
  s.version = Pronto::CoffeelintVersion::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Michael Siebert'
  s.email = 'siebertm85@googlemail.com'
  s.homepage = 'http://github.org/siebertm/pronto-coffeelint'
  s.summary = 'Pronto runner for Coffeelint, CoffeeScript code quality tool'

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'pronto', '~> 0.6'
  s.add_dependency 'coffeelint', '~> 1.14'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its', '~> 1.0'
end
