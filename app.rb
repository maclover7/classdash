require 'sinatra/base'

module ClassDash
  class App < Sinatra::Application
    get '/' do
      'Hello World'
    end
  end
end
