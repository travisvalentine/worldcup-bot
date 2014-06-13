require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:m01)
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
