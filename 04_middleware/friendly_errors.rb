class FriendlyErrors
  def initialize(app, opts = {})
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    if status >= 500
      body.close if body.respond_to?(:close)
      [status, headers, ["issue ..."]]
    else
      [status, headers, body]
    end
  end
end
