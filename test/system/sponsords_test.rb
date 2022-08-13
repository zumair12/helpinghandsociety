require "application_system_test_case"

class SponsordsTest < ApplicationSystemTestCase
  setup do
    @sponsord = sponsords(:one)
  end

  test "visiting the index" do
    visit sponsords_url
    assert_selector "h1", text: "Sponsords"
  end

  test "should create sponsord" do
    visit sponsords_url
    click_on "New sponsord"

    fill_in "End to", with: @sponsord.end_to
    fill_in "Name", with: @sponsord.name
    fill_in "Start from", with: @sponsord.start_from
    fill_in "Student", with: @sponsord.student_id
    click_on "Create Sponsord"

    assert_text "Sponsord was successfully created"
    click_on "Back"
  end

  test "should update Sponsord" do
    visit sponsord_url(@sponsord)
    click_on "Edit this sponsord", match: :first

    fill_in "End to", with: @sponsord.end_to
    fill_in "Name", with: @sponsord.name
    fill_in "Start from", with: @sponsord.start_from
    fill_in "Student", with: @sponsord.student_id
    click_on "Update Sponsord"

    assert_text "Sponsord was successfully updated"
    click_on "Back"
  end

  test "should destroy Sponsord" do
    visit sponsord_url(@sponsord)
    click_on "Destroy this sponsord", match: :first

    assert_text "Sponsord was successfully destroyed"
  end
end
