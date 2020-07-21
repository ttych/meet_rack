# class Application
#   def call(env)
#     [200, {}, ["Hello from Rack"]]
#   end
# end

# run Application.new

class ApplicationEnv
  def call(env)
    [200, {}, ["#{env}"]]
  end
end

run ApplicationEnv.new
