require "test_helper"

class StipendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stipend = stipends(:one)
  end

  test "should get index" do
    get stipends_url
    assert_response :success
  end

  test "should get new" do
    get new_stipend_url
    assert_response :success
  end

  test "should create stipend" do
    assert_difference("Stipend.count") do
      post stipends_url, params: { stipend: { amount: @stipend.amount, payment_method: @stipend.payment_method, recevied_at: @stipend.recevied_at, recevied_by: @stipend.recevied_by, stipend_in: @stipend.stipend_in, student_id: @stipend.student_id } }
    end

    assert_redirected_to stipend_url(Stipend.last)
  end

  test "should show stipend" do
    get stipend_url(@stipend)
    assert_response :success
  end

  test "should get edit" do
    get edit_stipend_url(@stipend)
    assert_response :success
  end

  test "should update stipend" do
    patch stipend_url(@stipend), params: { stipend: { amount: @stipend.amount, payment_method: @stipend.payment_method, recevied_at: @stipend.recevied_at, recevied_by: @stipend.recevied_by, stipend_in: @stipend.stipend_in, student_id: @stipend.student_id } }
    assert_redirected_to stipend_url(@stipend)
  end

  test "should destroy stipend" do
    assert_difference("Stipend.count", -1) do
      delete stipend_url(@stipend)
    end

    assert_redirected_to stipends_url
  end
end
