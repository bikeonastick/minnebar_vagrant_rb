$: << File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'rack/test'
include Rack::Test::Methods

def app
  Sinatra::Application
end

