require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get appoinments" do
    get home_appoinments_url
    assert_response :success
  end

end
