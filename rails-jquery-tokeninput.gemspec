# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/jquery/tokeninput/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails-jquery-tokeninput'
  spec.version       = Rails::Jquery::Tokeninput::VERSION
  spec.authors       = ['Evgeny Li']
  spec.email         = ['exaspark@gmail.com']
  spec.description   = %q{rails-jquery-tokeninput project integrates Tokeninput jQuery plugin which allows your users to select multiple items from a predefined list, using autocompletion as they type to find each item}
  spec.summary       = %q{Porting Tokeninput plugin}
  spec.homepage      = 'https://github.com/exAspArk/rails-jquery-tokeninput'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'jquery-rails', '>= 2'

  spec.add_development_dependency 'activemodel', '~> 4.1.9'
  spec.add_development_dependency 'actionpack', '~> 4.1.9'
  spec.add_development_dependency 'sprockets-rails'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'poltergeist'
  spec.add_development_dependency 'pry-byebug'
end
