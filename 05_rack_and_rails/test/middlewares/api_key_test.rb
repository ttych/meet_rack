require 'rack/test'

class ApiKeyTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    ApiKey.new(-> env { Rack::Response.new("ok").finish },
               database: { "1234" => {} })
  end

  def test_reject_unauthenticated
    get '/'
    assert_equal 403, last_response.status
    assert_equal "Forbidden", last_response.body
  end

  def test_authenticated
    get '/', {}, { "HTTP_API_KEY" => '1234' }
    assert_equal 200, last_response.status
    assert_equal "ok", last_response.body
  end
end
