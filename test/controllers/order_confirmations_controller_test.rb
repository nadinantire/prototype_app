require 'test_helper'

class OrderConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_confirmations_index_url
    assert_response :success
  end

  test "should get show" do
    get order_confirmations_show_url
    assert_response :success
  end

  test "should get new" do
    get order_confirmations_new_url
    assert_response :success
  end

  test "should get edit" do
    get order_confirmations_edit_url
    assert_response :success
  end

end
