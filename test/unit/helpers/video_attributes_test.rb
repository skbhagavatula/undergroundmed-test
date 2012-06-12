require 'test_helper'

class VideoAttributesTest < Test::Unit::TestCase

  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_get_category
    id = "vpw0bKOTDrs"

    category = VideoAttributes.find_category(id)
    assert_equal(VideoAttributes::OBGYN, category)
    assert_equal(38,  VideoAttributes.find_order(id))

    category = VideoAttributes.find_category("nonexistantid")
    assert_nil(category)
    assert_equal(nil,  VideoAttributes.find_order("nonexistantid"))

    category = VideoAttributes.find_category(nil)
    assert_nil(category)

    assert_equal(nil,  VideoAttributes.find_order(nil))

  end
end