require 'test_helper'

class ShowVideosControllerTest < ActionController::TestCase
  test "should get init" do
    get :init
    assert_response :success
  end

end
