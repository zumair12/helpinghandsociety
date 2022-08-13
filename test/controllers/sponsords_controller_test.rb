require "test_helper"

class SponsordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sponsord = sponsords(:one)
  end

  test "should get index" do
    get sponsords_url
    assert_response :success
  end

  test "should get new" do
    get new_sponsord_url
    assert_response :success
  end

  test "should create sponsord" do
    assert_difference("Sponsord.count") do
      post sponsords_url, params: { sponsord: { end_to: @sponsord.end_to, name: @sponsord.name, start_from: @sponsord.start_from, student_id: @sponsord.student_id } }
    end

    assert_redirected_to sponsord_url(Sponsord.last)
  end

  test "should show sponsord" do
    get sponsord_url(@sponsord)
    assert_response :success
  end

  test "should get edit" do
    get edit_sponsord_url(@sponsord)
    assert_response :success
  end

  test "should update sponsord" do
    patch sponsord_url(@sponsord), params: { sponsord: { end_to: @sponsord.end_to, name: @sponsord.name, start_from: @sponsord.start_from, student_id: @sponsord.student_id } }
    assert_redirected_to sponsord_url(@sponsord)
  end

  test "should destroy sponsord" do
    assert_difference("Sponsord.count", -1) do
      delete sponsord_url(@sponsord)
    end

    assert_redirected_to sponsords_url
  end
end
