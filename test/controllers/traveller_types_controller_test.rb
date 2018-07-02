require 'test_helper'

class TravellerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @traveller_type = traveller_types(:one)
  end

  test "should get index" do
    get traveller_types_url
    assert_response :success
  end

  test "should get new" do
    get new_traveller_type_url
    assert_response :success
  end

  test "should create traveller_type" do
    assert_difference('TravellerType.count') do
      post traveller_types_url, params: { traveller_type: { name: @traveller_type.name } }
    end

    assert_redirected_to traveller_type_url(TravellerType.last)
  end

  test "should show traveller_type" do
    get traveller_type_url(@traveller_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_traveller_type_url(@traveller_type)
    assert_response :success
  end

  test "should update traveller_type" do
    patch traveller_type_url(@traveller_type), params: { traveller_type: { name: @traveller_type.name } }
    assert_redirected_to traveller_type_url(@traveller_type)
  end

  test "should destroy traveller_type" do
    assert_difference('TravellerType.count', -1) do
      delete traveller_type_url(@traveller_type)
    end

    assert_redirected_to traveller_types_url
  end
end
