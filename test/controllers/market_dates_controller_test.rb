require 'test_helper'

class MarketDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market_date = market_dates(:one)
  end

  test "should get index" do
    get market_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_market_date_url
    assert_response :success
  end

  test "should create market_date" do
    assert_difference('MarketDate.count') do
      post market_dates_url, params: { market_date: { count: @market_date.count, day: @market_date.day, market_id: @market_date.market_id, unique_customers: @market_date.unique_customers } }
    end

    assert_redirected_to market_date_url(MarketDate.last)
  end

  test "should show market_date" do
    get market_date_url(@market_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_market_date_url(@market_date)
    assert_response :success
  end

  test "should update market_date" do
    patch market_date_url(@market_date), params: { market_date: { count: @market_date.count, day: @market_date.day, market_id: @market_date.market_id, unique_customers: @market_date.unique_customers } }
    assert_redirected_to market_date_url(@market_date)
  end

  test "should destroy market_date" do
    assert_difference('MarketDate.count', -1) do
      delete market_date_url(@market_date)
    end

    assert_redirected_to market_dates_url
  end
end
