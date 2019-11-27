require 'sinatra'


use Rack::Runtime

get '/' do
  "Just return text!"
end
