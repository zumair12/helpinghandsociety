require "application_system_test_case"

class StipendsTest < ApplicationSystemTestCase
  setup do
    @stipend = stipends(:one)
  end

  test "visiting the index" do
    visit stipends_url
    assert_selector "h1", text: "Stipends"
  end

  test "should create stipend" do
    visit stipends_url
    click_on "New stipend"

    fill_in "Amount", with: @stipend.amount
    fill_in "Payment method", with: @stipend.payment_method
    fill_in "Recevied at", with: @stipend.recevied_at
    fill_in "Recevied by", with: @stipend.recevied_by
    fill_in "Stipend month", with: @stipend.stipend_in
    fill_in "Student", with: @stipend.student_id
    click_on "Create Stipend"

    assert_text "Stipend was successfully created"
    click_on "Back"
  end

  test "should update Stipend" do
    visit stipend_url(@stipend)
    click_on "Edit this stipend", match: :first

    fill_in "Amount", with: @stipend.amount
    fill_in "Payment method", with: @stipend.payment_method
    fill_in "Recevied at", with: @stipend.recevied_at
    fill_in "Recevied by", with: @stipend.recevied_by
    fill_in "Stipend month", with: @stipend.stipend_in
    fill_in "Student", with: @stipend.student_id
    click_on "Update Stipend"

    assert_text "Stipend was successfully updated"
    click_on "Back"
  end

  test "should destroy Stipend" do
    visit stipend_url(@stipend)
    click_on "Destroy this stipend", match: :first

    assert_text "Stipend was successfully destroyed"
  end
end
