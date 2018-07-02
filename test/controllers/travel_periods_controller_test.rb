require 'test_helper'

class TravelPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_period = travel_periods(:one)
  end

  test "should get index" do
    get travel_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_period_url
    assert_response :success
  end

  test "should create travel_period" do
    assert_difference('TravelPeriod.count') do
      post travel_periods_url, params: { travel_period: { days: @travel_period.days } }
    end

    assert_redirected_to travel_period_url(TravelPeriod.last)
  end

  test "should show travel_period" do
    get travel_period_url(@travel_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_period_url(@travel_period)
    assert_response :success
  end

  test "should update travel_period" do
    patch travel_period_url(@travel_period), params: { travel_period: { days: @travel_period.days } }
    assert_redirected_to travel_period_url(@travel_period)
  end

  test "should destroy travel_period" do
    assert_difference('TravelPeriod.count', -1) do
      delete travel_period_url(@travel_period)
    end

    assert_redirected_to travel_periods_url
  end
end
