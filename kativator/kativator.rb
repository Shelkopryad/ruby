require 'sinatra'

get '/' do
  erb :index
end

post '/motivation' do
  @quotes = ["светит звёздочка с небес, непонятно на кой бес...",
    "голос, голосочек, а у тебя мозга кусочек",
    "у меня есть права на все земные и неземные жалобы и нытье"
  ]

  @name = params['name']
  @quote = @quotes.sample
  erb :motivator
end
