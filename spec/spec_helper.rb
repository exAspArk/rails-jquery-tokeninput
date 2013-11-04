ENV['RAILS_ENV'] = 'test'

require 'bundler/setup'

require File.expand_path('../support/dummy/config/environment.rb',  __FILE__)

require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
