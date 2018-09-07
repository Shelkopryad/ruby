require 'sinatra'
require 'net/http'
require "json"

get '/' do
  erb :'templates/index'
end

get '/leagues' do
  uri = URI('http://api.pathofexile.com/leagues')
  res = Net::HTTP.get_response(uri)
  @result = JSON.parse(res.body)
  erb :'templates/leagues'
end
