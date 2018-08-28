require 'sinatra'

get '/' do
  logger.info "loading data"
  erb :'templates/index'
end

post '/hello' do
  @name = params['name']
  logger.info @name
  erb :'templates/hello'
end
