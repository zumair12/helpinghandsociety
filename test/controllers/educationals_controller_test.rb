require "test_helper"

class EducationalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @educational = educationals(:one)
  end

  test "should get index" do
    get educationals_url
    assert_response :success
  end

  test "should get new" do
    get new_educational_url
    assert_response :success
  end

  test "should create educational" do
    assert_difference("Educational.count") do
      post educationals_url, params: { educational: { degree_id: @educational.degree_id, end_at: @educational.end_at, start_at: @educational.start_at, university_id: @educational.university_id } }
    end

    assert_redirected_to educational_url(Educational.last)
  end

  test "should show educational" do
    get educational_url(@educational)
    assert_response :success
  end

  test "should get edit" do
    get edit_educational_url(@educational)
    assert_response :success
  end

  test "should update educational" do
    patch educational_url(@educational), params: { educational: { degree_id: @educational.degree_id, end_at: @educational.end_at, start_at: @educational.start_at, university_id: @educational.university_id } }
    assert_redirected_to educational_url(@educational)
  end

  test "should destroy educational" do
    assert_difference("Educational.count", -1) do
      delete educational_url(@educational)
    end

    assert_redirected_to educationals_url
  end
end
