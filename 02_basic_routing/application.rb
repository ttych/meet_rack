require 'pp'
require 'json'

class Application
  def call(env)
    if env["PATH_INFO"] == "/users"
      [200, {}, [User.all.to_json]]
    elsif env["PATH_INFO"] =~ %r{/users/\d+}
      id = env["PATH_INFO"].split("/").last.to_i
      [200, {}, [User.all[id].to_json]]
    else
      [400, {}, ["Nothing Here!"]]
    end
  end

  def dbg(obj)
    PP.pp(obj, $stderr, 200)
  end
end
