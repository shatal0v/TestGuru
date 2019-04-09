require 'test_helper'

class MailsControllerTest < ActionDispatch::IntegrationTest
  test "should get feedback" do
    get mails_feedback_url
    assert_response :success
  end

end
