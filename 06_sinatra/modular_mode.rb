require 'sinatra/base'

class Modular < Sinatra::Base
  use Rack::Runtime

  get '/' do
    "Modular mode"
  end
end
