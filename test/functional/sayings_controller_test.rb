require 'test_helper'

class SayingsControllerTest < ActionController::TestCase
  test "should render" do
    get :random
    assert_response 200
  end
end
