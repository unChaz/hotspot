require 'test_helper'

class AccessRequestsControllerTest < ActionController::TestCase
  setup do
    @access_request = access_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_request" do
    assert_difference('AccessRequest.count') do
      post :create, access_request: { approved: @access_request.approved, denied: @access_request.denied, reason: @access_request.reason, user: @access_request.user }
    end

    assert_redirected_to access_request_path(assigns(:access_request))
  end

  test "should show access_request" do
    get :show, id: @access_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @access_request
    assert_response :success
  end

  test "should update access_request" do
    patch :update, id: @access_request, access_request: { approved: @access_request.approved, denied: @access_request.denied, reason: @access_request.reason, user: @access_request.user }
    assert_redirected_to access_request_path(assigns(:access_request))
  end

  test "should destroy access_request" do
    assert_difference('AccessRequest.count', -1) do
      delete :destroy, id: @access_request
    end

    assert_redirected_to access_requests_path
  end
end
