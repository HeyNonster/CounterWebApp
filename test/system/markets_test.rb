require "application_system_test_case"

class MarketsTest < ApplicationSystemTestCase
  setup do
    @market = markets(:one)
  end

  test "visiting the index" do
    visit markets_url
    assert_selector "h1", text: "Markets"
  end

  test "creating a Market" do
    visit markets_url
    click_on "New Market"

    fill_in "End time", with: @market.end_time
    fill_in "Kind", with: @market.kind
    fill_in "Name", with: @market.name
    fill_in "Start time", with: @market.start_time
    click_on "Create Market"

    assert_text "Market was successfully created"
    click_on "Back"
  end

  test "updating a Market" do
    visit markets_url
    click_on "Edit", match: :first

    fill_in "End time", with: @market.end_time
    fill_in "Kind", with: @market.kind
    fill_in "Name", with: @market.name
    fill_in "Start time", with: @market.start_time
    click_on "Update Market"

    assert_text "Market was successfully updated"
    click_on "Back"
  end

  test "destroying a Market" do
    visit markets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Market was successfully destroyed"
  end
end
