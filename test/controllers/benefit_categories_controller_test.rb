require 'test_helper'

class BenefitCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benefit_category = benefit_categories(:one)
  end

  test "should get index" do
    get benefit_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_benefit_category_url
    assert_response :success
  end

  test "should create benefit_category" do
    assert_difference('BenefitCategory.count') do
      post benefit_categories_url, params: { benefit_category: { from: @benefit_category.from, name: @benefit_category.name, to: @benefit_category.to } }
    end

    assert_redirected_to benefit_category_url(BenefitCategory.last)
  end

  test "should show benefit_category" do
    get benefit_category_url(@benefit_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_benefit_category_url(@benefit_category)
    assert_response :success
  end

  test "should update benefit_category" do
    patch benefit_category_url(@benefit_category), params: { benefit_category: { from: @benefit_category.from, name: @benefit_category.name, to: @benefit_category.to } }
    assert_redirected_to benefit_category_url(@benefit_category)
  end

  test "should destroy benefit_category" do
    assert_difference('BenefitCategory.count', -1) do
      delete benefit_category_url(@benefit_category)
    end

    assert_redirected_to benefit_categories_url
  end
end
