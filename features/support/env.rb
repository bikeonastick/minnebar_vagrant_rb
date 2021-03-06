# Generated by cucumber-sinatra. (2013-03-09 23:55:05 -0600)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/application.rb')

require 'capybara'
require 'capybara/cucumber'
require 'webmock/cucumber'
require 'rspec'

Capybara.app = Application

class ApplicationWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ApplicationWorld.new
end
