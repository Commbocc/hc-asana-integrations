require "application_system_test_case"

class CustomFieldsTest < ApplicationSystemTestCase
  setup do
    @custom_field = custom_fields(:one)
  end

  test "visiting the index" do
    visit custom_fields_url
    assert_selector "h1", text: "Custom Fields"
  end

  test "creating a Custom field" do
    visit custom_fields_url
    click_on "New Custom Field"

    click_on "Create Custom field"

    assert_text "Custom field was successfully created"
    click_on "Back"
  end

  test "updating a Custom field" do
    visit custom_fields_url
    click_on "Edit", match: :first

    click_on "Update Custom field"

    assert_text "Custom field was successfully updated"
    click_on "Back"
  end

  test "destroying a Custom field" do
    visit custom_fields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Custom field was successfully destroyed"
  end
end
