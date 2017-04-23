require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get about_about_us_url
    assert_response :success
  end

end
