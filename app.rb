require 'sinatra/base'

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

module ClassDash
  class App < Sinatra::Application
    get '/' do
      erb :index
    end

    get '/auth/:name/callback' do
      auth = request.env['omniauth.auth']
      session['user'] = {
        'first_name' => auth['info']['first_name'],
        'token' => auth['credentials']['token']
      }

      redirect '/'
    end

    private

    def current_user
      session['user']
    end
  end
end
