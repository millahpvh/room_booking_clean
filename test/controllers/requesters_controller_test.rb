require "test_helper"

class RequestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requester = requesters(:one)
  end

  test "should get index" do
    get requesters_url
    assert_response :success
  end

  test "should get new" do
    get new_requester_url
    assert_response :success
  end

  test "should create requester" do
    assert_difference("Requester.count") do
      post requesters_url, params: { requester: { active: @requester.active, depart: @requester.depart, email: @requester.email, name: @requester.name, phone: @requester.phone } }
    end

    assert_redirected_to requester_url(Requester.last)
  end

  test "should show requester" do
    get requester_url(@requester)
    assert_response :success
  end

  test "should get edit" do
    get edit_requester_url(@requester)
    assert_response :success
  end

  test "should update requester" do
    patch requester_url(@requester), params: { requester: { active: @requester.active, depart: @requester.depart, email: @requester.email, name: @requester.name, phone: @requester.phone } }
    assert_redirected_to requester_url(@requester)
  end

  test "should destroy requester" do
    assert_difference("Requester.count", -1) do
      delete requester_url(@requester)
    end

    assert_redirected_to requesters_url
  end
end
