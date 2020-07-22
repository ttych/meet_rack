#!/usr/bin/env ruby
# -*- mode: ruby -*-

require_relative 'api_key'
require_relative 'validate_content_type'
require_relative 'who_is_calling'
require_relative 'file_logger'

require_relative 'users_application'
require_relative 'rides_application'

#use Rack::Session::Cookie, secret: "chut!"
#use Rack::Session::Pool
# use Rack::Session::Memcache
#use Rack::Session::Dalli

# use Rack::Runtime  # server perf
use Rack::ContentType, "application/json"  # set default content-type
use Rack::ContentLength

use Rack::ETag  # http reponse finger print
use Rack::ConditionalGet

# use Rack::Deflater  # compression

if ENV["RACK_ENV"] == 'production'
  use Rack::NullLogger
  use Rack::CommonLogger
else
  use Rack::Logger
  use Rack::Reloader
end

use FileLogger
use ApiKey
use ValidateContentType
use WhoIsCalling

# use Rack::ShowStatus  # clean webpage in case of error

use Rack::Sendfile
use Rack::Static, urls: ["/docs"], root: "public"

# map("/docs") do
#   run Rack::File.new("./docs")
# end

map("/users") do
  run UsersApplication.new
end

map("/rides") do
  run RidesApplication.new
end
