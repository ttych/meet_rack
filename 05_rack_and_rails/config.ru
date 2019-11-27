# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require_relative 'lib/status_check_app'
require_relative 'lib/api_key'

## Moved to routes.rb
#require_relative 'lib/status_check_app'

# map("/status") do
#   run StatusCheckApp.new
# end

run Rails.application
