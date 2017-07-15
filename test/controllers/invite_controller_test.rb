require 'test_helper'

class InviteControllerTest < ActionDispatch::IntegrationTest
  test "should get done" do
    get invite_done_url
    assert_response :success
  end

end
