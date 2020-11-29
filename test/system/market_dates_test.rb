require "application_system_test_case"

class MarketDatesTest < ApplicationSystemTestCase
  setup do
    @market_date = market_dates(:one)
  end

  test "visiting the index" do
    visit market_dates_url
    assert_selector "h1", text: "Market Dates"
  end

  test "creating a Market date" do
    visit market_dates_url
    click_on "New Market Date"

    fill_in "Count", with: @market_date.count
    fill_in "Day", with: @market_date.day
    fill_in "Market", with: @market_date.market_id
    fill_in "Unique customers", with: @market_date.unique_customers
    click_on "Create Market date"

    assert_text "Market date was successfully created"
    click_on "Back"
  end

  test "updating a Market date" do
    visit market_dates_url
    click_on "Edit", match: :first

    fill_in "Count", with: @market_date.count
    fill_in "Day", with: @market_date.day
    fill_in "Market", with: @market_date.market_id
    fill_in "Unique customers", with: @market_date.unique_customers
    click_on "Update Market date"

    assert_text "Market date was successfully updated"
    click_on "Back"
  end

  test "destroying a Market date" do
    visit market_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Market date was successfully destroyed"
  end
end
