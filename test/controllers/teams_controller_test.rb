require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:bra)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end
end
