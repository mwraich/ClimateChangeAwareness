require "application_system_test_case"

class ClimatesTest < ApplicationSystemTestCase
  setup do
    @climate = climates(:one)
  end

  test "visiting the index" do
    visit climates_url
    assert_selector "h1", text: "Climates"
  end

  test "creating a Climate" do
    visit climates_url
    click_on "New Climate"

    click_on "Create Climate"

    assert_text "Climate was successfully created"
    click_on "Back"
  end

  test "updating a Climate" do
    visit climates_url
    click_on "Edit", match: :first

    click_on "Update Climate"

    assert_text "Climate was successfully updated"
    click_on "Back"
  end

  test "destroying a Climate" do
    visit climates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Climate was successfully destroyed"
  end
end
