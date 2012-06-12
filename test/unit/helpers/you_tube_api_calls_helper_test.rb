require 'test_helper'

class YouTubeApiCallsHelperTest < ActionView::TestCase

  test "getvideolist" do

    response = YouTubeApiCallsHelper.get_video_list
    assert_not_nil(response)
    assert_equal("200", response.code)
  end

  test "read_video_list" do
    xml = File.read("test/fixtures/videolist.xml")
    video_list = YouTubeApiCallsHelper.parse_video_list(xml)

    assert_equal(25, video_list.length)
    check_one_video(video_list[0])

  end

  test "read_one_entry"   do
    xml = File.read("test/fixtures/oneentry.xml")
    assert_not_nil(xml)

    doc = REXML::Document.new xml
    assert_not_nil(doc)

    doc.elements.each("feed/entry") do |element|
      video =  YouTubeApiCallsHelper.parse_one_entry(element)

      check_one_video(video)

    end
  end

  test "unknown_video_order" do
    xml = File.read("test/fixtures/unknownvideos.xml")
    video_list = YouTubeApiCallsHelper.parse_video_list(xml)

    assert_equal(5, video_list.length)

    assert_equal(15, video_list[0].order)
    assert_equal(36, video_list[1].order)
    assert_equal(1000, video_list[2].order)
    assert_equal(1001, video_list[3].order)
    assert_equal(1002, video_list[4].order)
  end

  test "test_duration_as_minutes"   do
    xml = File.read("test/fixtures/oneentry.xml")
    assert_not_nil(xml)

    doc = REXML::Document.new xml
    assert_not_nil(doc)

    doc.elements.each("feed/entry") do |element|
      video =  YouTubeApiCallsHelper.parse_one_entry(element)

      check_one_video(video)

      minutes = video.get_duration_minutes
      assert_equal("6:58", minutes)

    end
  end

  test "nill_duration" do
    video = Video.new

    duration = video.to_minutes(nil)
    assert_equal("0:00", duration)
  end

  test "attributes_for_unknown ids" do
    id =  "xyzzy"
    video = Video.new

    video.set_category(id)
    assert_equal(VideoAttributes::OTHER, video.category)

    video.set_order(id)
    assert_equal(Video::SORTLAST, video.order)

  end

  def check_one_video(video)

    assert_not_nil(video)
    assert_equal("5.0", video.avg_rating)
    assert_equal("0", video.dislikes)
    assert_equal("418", video.duration)
    assert_equal("2", video.favorite_count)
    assert_equal("6", video.likes)
    assert_equal("5", video.max_rating)
    assert_equal("1", video.min_rating)
    assert_equal("6", video.num_raters)
    assert_equal("Insulin Sliding Scale Explaned!", video.title)
    assert_equal("735", video.view_count)
    assert_equal("6", video.likes)
    assert_equal("WF1s01ePXLI", video.yt_id)
    assert_equal("http://i.ytimg.com/vi/WF1s01ePXLI/mqdefault.jpg", video.thumbnail)
    assert_equal(VideoAttributes::MEDICINE, video.category)
    assert_equal(15, video.order)
    assert_equal("6:58", video.duration_in_minutes)

  end

  end

