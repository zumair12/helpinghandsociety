require "application_system_test_case"

class EducationalsTest < ApplicationSystemTestCase
  setup do
    @educational = educationals(:one)
  end

  test "visiting the index" do
    visit educationals_url
    assert_selector "h1", text: "Educationals"
  end

  test "should create educational" do
    visit educationals_url
    click_on "New educational"

    fill_in "Degree", with: @educational.degree_id
    fill_in "End at", with: @educational.end_at
    fill_in "Start at", with: @educational.start_at
    fill_in "University", with: @educational.university_id
    click_on "Create Educational"

    assert_text "Educational was successfully created"
    click_on "Back"
  end

  test "should update Educational" do
    visit educational_url(@educational)
    click_on "Edit this educational", match: :first

    fill_in "Degree", with: @educational.degree_id
    fill_in "End at", with: @educational.end_at
    fill_in "Start at", with: @educational.start_at
    fill_in "University", with: @educational.university_id
    click_on "Update Educational"

    assert_text "Educational was successfully updated"
    click_on "Back"
  end

  test "should destroy Educational" do
    visit educational_url(@educational)
    click_on "Destroy this educational", match: :first

    assert_text "Educational was successfully destroyed"
  end
end
