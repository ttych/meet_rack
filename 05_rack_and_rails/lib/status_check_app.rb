class StatusCheckApp
  def call(env)
    Rack::Response.new("ok").finish
  end
end
