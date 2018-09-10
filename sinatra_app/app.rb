require 'sinatra'
require 'net/http'
require "json"

# file = File.read "gwent/cards.json"
# data = JSON.parse(file)
# data.each do |key, value|
#   unless value['categories'].nil?
#     p value['variations'][key + "00"]['art']['low']
#   end
# end

get '/' do
  erb :'templates/index'
end

get '/leagues' do
  uri = URI('http://api.pathofexile.com/leagues')
  res = Net::HTTP.get_response(uri)
  @result = JSON.parse(res.body)
  erb :'templates/leagues'
end

get '/gwent' do
  file = File.read "gwent/cards.json"
  @data = JSON.parse(file)
  erb :'templates/gwent'
end
