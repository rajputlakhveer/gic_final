require "test_helper"

class UpcomingTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upcoming_trips_index_url
    assert_response :success
  end
end
