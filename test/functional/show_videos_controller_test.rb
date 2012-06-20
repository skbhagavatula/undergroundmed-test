require 'test_helper'

class ShowVideosControllerTest < ActionController::TestCase
  test "should get init" do
    get :init
    assert_response :success
  end

  test "get_video_list"  do
    xml =  File.read("test/fixtures/videolist.xml");
    all_video_list = []
    YouTubeApiCallsHelper.parse_video_list(xml, all_video_list)

   response =  get(:get_list, {'category' => VideoAttributes::RADIOLOGY}, {ShowVideosController::SESSION_KEY_ALL_VIDEOS => all_video_list}, nil)
   body =JSON.parse(response.body)
   assert_equal(9, body.length)

  end


end
