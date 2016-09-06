require_relative './app.rb'

require 'omniauth-google-oauth2'
use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end

run ClassDash::App
