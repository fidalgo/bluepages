require_relative '../../app'
require_relative '../test_helper'

require 'test/unit'
require 'rack/test'

class BluePagesTest < Test::Unit::Testcase
  include Rack::Test::Methods

  def app
    BluePages.new
  end

 def test_empty 
   get '/company'
   assert_equal true
 end
end
