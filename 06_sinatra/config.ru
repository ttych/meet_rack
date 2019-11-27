require_relative 'modular_mode'

# use Rack::Runtime

map("/modular") do
  run Modular
end

# map("something_else") do
#   run SomeOtherApp
# end
