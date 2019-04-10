require 'test_helper'

class BagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bages_show_url
    assert_response :success
  end

end
