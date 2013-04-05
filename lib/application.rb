require 'sinatra/base'
require 'net/http'
require 'haml'
require 'json'
require 'cgi'
require 'open-uri'

class Application < Sinatra::Base
  set :app_file, __FILE__
  set :inline_templates, true
  set :api_server, 'http://10.0.10.30:8080/minnebar'
  #set :api_server, 'http://10.1.10.10:8080/minnebar'

  get '/' do
    not_found
  end

  get '/hello/:id' do
    greeting_id=params[:id]
    @who_to_say = api_get_call(greeting_id)

    haml :hello
  end

  get '/save_hello/:id/:name' do
    @name = params[:name]
    @id= params[:id]
    @who_to_say = api_post_call(@id,@name)
    haml :hello
  end

  get '/hello/' do
    not_found
  end

  not_found do
    halt 404
  end

  error do
    halt 500
  end

  def api_get_call ( id )
    @server = settings.api_server
    uri = URI("#{@server}/store/#{id}")
    response = Net::HTTP.get(uri)
  end

  def api_post_call (id,name)
    @server = 'http://10.1.10.10:8080/minnebar'
    uri = URI("#{@server}/store")
    response = Net::HTTP.post_form(uri, 'key' => id, 'value' => name)
    if (response.code == '201')
      "you said:#{name}"
    else
      "didn't store #{name} with id:#{id}"
    end
  end


end

