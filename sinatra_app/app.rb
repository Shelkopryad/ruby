require 'sinatra'

get '/' do
  logger.info "loading data"
  erb :index
end

post '/hello' do
  @name = params['name']
  logger.info @name
  erb :hello
end
