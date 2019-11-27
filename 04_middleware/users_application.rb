require 'pp'
require 'json'

require_relative 'user'
require_relative 'application_helpers'

class UsersApplication
  include ApplicationHelpers

  def call(env)
    dbg(env)

    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers["Content-Type"] = 'application/json'

    case request.path_info
    when request.get? && ""
      get_all_users(request, response)
    when request.get? && %r{/\d+}
      get_a_user(request, response)
    else
      missing(request, response)
    end

    response.finish
  end

  def users(auth_user_id)
    User.all(auth_user_id)
  end

  def get_all_users(request, response)
    respond_with_object(response, users(request.env["rides_app.user_id"]))
  end

  def get_a_user(request, response)
    id = request.path_info.split("/").last.to_i
    user = users(request.env["rides_app.user_id"])[id]
    if user.nil?
      error(response, "No user with id #{id}", 404)
    else
      respond_with_object(response, user)
    end
  end

  def dbg(obj)
    PP.pp(obj, $stderr, 200)
  end
end
