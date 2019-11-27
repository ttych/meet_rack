require 'pp'

class ApiKey
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    pp env
    api_key = env["HTTP_API_KEY"]
    user = User.user_by_api_key(api_key)

    if user.nil?
      [ 403, {}, ["Forbidden"]]
    else
      env["rides_app.user_id"] = user[:id]
      @app.call(env)
    end
  end
end
