require "application_system_test_case"

class TalkTablesTest < ApplicationSystemTestCase
  setup do
    @talk_table = talk_tables(:one)
  end

  test "visiting the index" do
    visit talk_tables_url
    assert_selector "h1", text: "Talk Tables"
  end

  test "creating a Talk table" do
    visit talk_tables_url
    click_on "New Talk Table"

    fill_in "Input", with: @talk_table.input
    fill_in "Message", with: @talk_table.message
    fill_in "Tag", with: @talk_table.tag
    click_on "Create Talk table"

    assert_text "Talk table was successfully created"
    click_on "Back"
  end

  test "updating a Talk table" do
    visit talk_tables_url
    click_on "Edit", match: :first

    fill_in "Input", with: @talk_table.input
    fill_in "Message", with: @talk_table.message
    fill_in "Tag", with: @talk_table.tag
    click_on "Update Talk table"

    assert_text "Talk table was successfully updated"
    click_on "Back"
  end

  test "destroying a Talk table" do
    visit talk_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Talk table was successfully destroyed"
  end
end
