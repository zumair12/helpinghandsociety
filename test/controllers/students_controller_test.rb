require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { address: @student.address, category_id: @student.category_id, cnic: @student.cnic, degree: @student.degree, emergency_number: @student.emergency_number, father_name: @student.father_name, father_occupation: @student.father_occupation, jazzcash_number: @student.jazzcash_number, mobile_number: @student.mobile_number, name: @student.name, registered_at: @student.registered_at, state: @student.state, stipend_end_at: @student.stipend_end_at, stipend_start_at: @student.stipend_start_at, unversity_name: @student.unversity_name } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, category_id: @student.category_id, cnic: @student.cnic, degree: @student.degree, emergency_number: @student.emergency_number, father_name: @student.father_name, father_occupation: @student.father_occupation, jazzcash_number: @student.jazzcash_number, mobile_number: @student.mobile_number, name: @student.name, registered_at: @student.registered_at, state: @student.state, stipend_end_at: @student.stipend_end_at, stipend_start_at: @student.stipend_start_at, unversity_name: @student.unversity_name } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
