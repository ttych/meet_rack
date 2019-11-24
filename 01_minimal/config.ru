class Application
  def call(env)
    [200, {}, ["Hello from Rack", "Byebye"]]
  end
end

run Application.new
