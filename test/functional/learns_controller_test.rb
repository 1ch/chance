require 'test_helper'

class LearnsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
