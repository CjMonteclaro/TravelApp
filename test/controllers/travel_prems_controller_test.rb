require 'test_helper'

class TravelPremsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_prem = travel_prems(:one)
  end

  test "should get index" do
    get travel_prems_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_prem_url
    assert_response :success
  end

  test "should create travel_prem" do
    assert_difference('TravelPrem.count') do
      post travel_prems_url, params: { travel_prem: { destination_class_id: @travel_prem.destination_class_id, from: @travel_prem.from, prem_type: @travel_prem.prem_type, premium: @travel_prem.premium, to: @travel_prem.to, travel_period_id: @travel_prem.travel_period_id } }
    end

    assert_redirected_to travel_prem_url(TravelPrem.last)
  end

  test "should show travel_prem" do
    get travel_prem_url(@travel_prem)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_prem_url(@travel_prem)
    assert_response :success
  end

  test "should update travel_prem" do
    patch travel_prem_url(@travel_prem), params: { travel_prem: { destination_class_id: @travel_prem.destination_class_id, from: @travel_prem.from, prem_type: @travel_prem.prem_type, premium: @travel_prem.premium, to: @travel_prem.to, travel_period_id: @travel_prem.travel_period_id } }
    assert_redirected_to travel_prem_url(@travel_prem)
  end

  test "should destroy travel_prem" do
    assert_difference('TravelPrem.count', -1) do
      delete travel_prem_url(@travel_prem)
    end

    assert_redirected_to travel_prems_url
  end
end
