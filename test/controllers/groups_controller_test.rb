require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  test "should show group standings" do
    get :show, id: 'A'
    assert_response :success
  end
end
