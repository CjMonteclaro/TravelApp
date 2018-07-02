require 'test_helper'

class DestinationClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destination_class = destination_classes(:one)
  end

  test "should get index" do
    get destination_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_destination_class_url
    assert_response :success
  end

  test "should create destination_class" do
    assert_difference('DestinationClass.count') do
      post destination_classes_url, params: { destination_class: { name: @destination_class.name } }
    end

    assert_redirected_to destination_class_url(DestinationClass.last)
  end

  test "should show destination_class" do
    get destination_class_url(@destination_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_destination_class_url(@destination_class)
    assert_response :success
  end

  test "should update destination_class" do
    patch destination_class_url(@destination_class), params: { destination_class: { name: @destination_class.name } }
    assert_redirected_to destination_class_url(@destination_class)
  end

  test "should destroy destination_class" do
    assert_difference('DestinationClass.count', -1) do
      delete destination_class_url(@destination_class)
    end

    assert_redirected_to destination_classes_url
  end
end
