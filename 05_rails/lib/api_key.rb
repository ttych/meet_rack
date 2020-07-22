class ApiKey
  def initialize(app, opts = {})
    @app = app
    @keys = opts[:database]
  end

  def call(env)
    user = @keys[env["HTTP_API_KEY"]]

    if user.nil?
      [403, {}, ["Forbidden"]]
    else
      env["rides_app.user_id"] = user[:id]
      @app.call(env)
    end
  end
end
