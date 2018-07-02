require 'test_helper'

class BenefitLimitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benefit_limit = benefit_limits(:one)
  end

  test "should get index" do
    get benefit_limits_url
    assert_response :success
  end

  test "should get new" do
    get new_benefit_limit_url
    assert_response :success
  end

  test "should create benefit_limit" do
    assert_difference('BenefitLimit.count') do
      post benefit_limits_url, params: { benefit_limit: { benefit_category_id: @benefit_limit.benefit_category_id, benefit_id: @benefit_limit.benefit_id, currency: @benefit_limit.currency, destination_class_id: @benefit_limit.destination_class_id, from: @benefit_limit.from, limit: @benefit_limit.limit, remarks: @benefit_limit.remarks, to: @benefit_limit.to } }
    end

    assert_redirected_to benefit_limit_url(BenefitLimit.last)
  end

  test "should show benefit_limit" do
    get benefit_limit_url(@benefit_limit)
    assert_response :success
  end

  test "should get edit" do
    get edit_benefit_limit_url(@benefit_limit)
    assert_response :success
  end

  test "should update benefit_limit" do
    patch benefit_limit_url(@benefit_limit), params: { benefit_limit: { benefit_category_id: @benefit_limit.benefit_category_id, benefit_id: @benefit_limit.benefit_id, currency: @benefit_limit.currency, destination_class_id: @benefit_limit.destination_class_id, from: @benefit_limit.from, limit: @benefit_limit.limit, remarks: @benefit_limit.remarks, to: @benefit_limit.to } }
    assert_redirected_to benefit_limit_url(@benefit_limit)
  end

  test "should destroy benefit_limit" do
    assert_difference('BenefitLimit.count', -1) do
      delete benefit_limit_url(@benefit_limit)
    end

    assert_redirected_to benefit_limits_url
  end
end
