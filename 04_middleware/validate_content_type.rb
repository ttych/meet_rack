class ValidateContentType
  def initialize(app, opts = {})
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    if headers["Content-Type"] == "application/json"
      begin
        content = ""
        body.each { |entry| content += entry }

        JSON.parse(content)

        [status, headers, body]
      rescue JSON::ParserError
        headers["Content-Type"] = "text/plain"
        response = Rack::Response.new(body, status, content)
        response.finish
      end
    end
  end
end
