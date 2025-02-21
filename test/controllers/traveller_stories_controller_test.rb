require "test_helper"

class TravellerStoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get traveller_stories_index_url
    assert_response :success
  end
end
