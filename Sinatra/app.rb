require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.

  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    name = params[:name] || 'Test'

    return 'Some '+name
  end

  post '/hello' do
    name = params[:name]

    return 'Hello '+name 
  end
end