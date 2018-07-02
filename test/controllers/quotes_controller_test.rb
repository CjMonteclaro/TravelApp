require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { base_prem: @quote.base_prem, destination_class_id: @quote.destination_class_id, duration: @quote.duration, end_date: @quote.end_date, gross_prem: @quote.gross_prem, policies_count: @quote.policies_count, policy_issued: @quote.policy_issued, schengen_end_date: @quote.schengen_end_date, start_date: @quote.start_date, total_charges: @quote.total_charges, travel_prem_id: @quote.travel_prem_id, traveller_type_id: @quote.traveller_type_id, travellers_count: @quote.travellers_count, user_id: @quote.user_id } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { base_prem: @quote.base_prem, destination_class_id: @quote.destination_class_id, duration: @quote.duration, end_date: @quote.end_date, gross_prem: @quote.gross_prem, policies_count: @quote.policies_count, policy_issued: @quote.policy_issued, schengen_end_date: @quote.schengen_end_date, start_date: @quote.start_date, total_charges: @quote.total_charges, travel_prem_id: @quote.travel_prem_id, traveller_type_id: @quote.traveller_type_id, travellers_count: @quote.travellers_count, user_id: @quote.user_id } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
