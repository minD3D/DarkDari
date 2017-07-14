require 'test_helper'

class LocationappControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get locationapp_new_url
    assert_response :success
  end

  test "should get edit" do
    get locationapp_edit_url
    assert_response :success
  end

  test "should get show" do
    get locationapp_show_url
    assert_response :success
  end

end
