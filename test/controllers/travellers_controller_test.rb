require 'test_helper'

class TravellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @traveller = travellers(:one)
  end

  test "should get index" do
    get travellers_url
    assert_response :success
  end

  test "should get new" do
    get new_traveller_url
    assert_response :success
  end

  test "should create traveller" do
    assert_difference('Traveller.count') do
      post travellers_url, params: { traveller: { age: @traveller.age, base_prem: @traveller.base_prem, beneficiary: @traveller.beneficiary, birthdate: @traveller.birthdate, first_name: @traveller.first_name, gross_prem: @traveller.gross_prem, last_name: @traveller.last_name, policy_id: @traveller.policy_id, quote_id: @traveller.quote_id, total_charges: @traveller.total_charges, travel_prem_id: @traveller.travel_prem_id } }
    end

    assert_redirected_to traveller_url(Traveller.last)
  end

  test "should show traveller" do
    get traveller_url(@traveller)
    assert_response :success
  end

  test "should get edit" do
    get edit_traveller_url(@traveller)
    assert_response :success
  end

  test "should update traveller" do
    patch traveller_url(@traveller), params: { traveller: { age: @traveller.age, base_prem: @traveller.base_prem, beneficiary: @traveller.beneficiary, birthdate: @traveller.birthdate, first_name: @traveller.first_name, gross_prem: @traveller.gross_prem, last_name: @traveller.last_name, policy_id: @traveller.policy_id, quote_id: @traveller.quote_id, total_charges: @traveller.total_charges, travel_prem_id: @traveller.travel_prem_id } }
    assert_redirected_to traveller_url(@traveller)
  end

  test "should destroy traveller" do
    assert_difference('Traveller.count', -1) do
      delete traveller_url(@traveller)
    end

    assert_redirected_to travellers_url
  end
end
