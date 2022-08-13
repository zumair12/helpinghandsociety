require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Address", with: @student.address
    fill_in "Category", with: @student.category_id
    fill_in "Cnic", with: @student.cnic
    fill_in "Degree", with: @student.degree
    fill_in "Emergency number", with: @student.emergency_number
    fill_in "Father name", with: @student.father_name
    fill_in "Father occupation", with: @student.father_occupation
    fill_in "Jazzcash number", with: @student.jazzcash_number
    fill_in "Mobile number", with: @student.mobile_number
    fill_in "Name", with: @student.name
    fill_in "Registered at", with: @student.registered_at
    fill_in "State", with: @student.state
    fill_in "Stipend end at", with: @student.stipend_end_at
    fill_in "Stipend start at", with: @student.stipend_start_at
    fill_in "Unversity name", with: @student.unversity_name
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Address", with: @student.address
    fill_in "Category", with: @student.category_id
    fill_in "Cnic", with: @student.cnic
    fill_in "Degree", with: @student.degree
    fill_in "Emergency number", with: @student.emergency_number
    fill_in "Father name", with: @student.father_name
    fill_in "Father occupation", with: @student.father_occupation
    fill_in "Jazzcash number", with: @student.jazzcash_number
    fill_in "Mobile number", with: @student.mobile_number
    fill_in "Name", with: @student.name
    fill_in "Registered at", with: @student.registered_at
    fill_in "State", with: @student.state
    fill_in "Stipend end at", with: @student.stipend_end_at
    fill_in "Stipend start at", with: @student.stipend_start_at
    fill_in "Unversity name", with: @student.unversity_name
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
