require 'test_helper'

class MoneyappControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get moneyapp_new_url
    assert_response :success
  end

  test "should get edit" do
    get moneyapp_edit_url
    assert_response :success
  end

  test "should get show" do
    get moneyapp_show_url
    assert_response :success
  end

end
