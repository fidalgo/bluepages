require_relative "spec_helper"

require 'rack/test'
require 'json'

class StoryTest < UnitTest
  include Rack::Test::Methods

  register_spec_type(/Story$/, self)

  def app
    BluePages
  end
end
