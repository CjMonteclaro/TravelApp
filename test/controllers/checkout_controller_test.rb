require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get success" do
    get checkout_success_url
    assert_response :success
  end

  test "should get failure" do
    get checkout_failure_url
    assert_response :success
  end

  test "should get cancelled" do
    get checkout_cancelled_url
    assert_response :success
  end

end
