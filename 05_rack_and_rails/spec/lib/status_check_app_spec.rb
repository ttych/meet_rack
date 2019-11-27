require 'spec_helper'
require 'rack/test'

require_relative '../../lib/status_check_app'

describe StatusCheckApp do
  include Rack::Test::Methods

  def app
    StatusCheckApp.new
  end

  it 'works !' do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("ok")
  end
end
