require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "should get location" do
    get :location
    assert_response :success
  end

end
