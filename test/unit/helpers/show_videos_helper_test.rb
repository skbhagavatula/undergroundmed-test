require 'test_helper'

class ShowVideosHelperTest < ActionController::TestCase

  def setup
    @controller = ShowVideosController.new
  end

  test "test_init" do
    response = get :init
    assert_response :success
  end

  test "sort_by_order" do
    video1 = Video.new
    video1.order = 3
    video1.avg_rating = "video1"

    video2 = Video.new
    video2.order = 2
    video2.avg_rating = "video2"

    video3 = Video.new
    video3.order = 1
    video3.avg_rating = "video3"

    videolist =[video1, video2, video3]

    sorted_list = @controller.sort_by_order(videolist)
    assert_equal(1, sorted_list[0].order)
    assert_equal(2, sorted_list[1].order)
    assert_equal(3, sorted_list[2].order)
  end


end
