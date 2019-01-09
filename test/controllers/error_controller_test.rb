require 'test_helper'

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get error_not_found_url
    assert_response :success
  end

  test "should get forbidden" do
    get error_forbidden_url
    assert_response :success
  end

  test "should get internal_server_error" do
    get error_internal_server_error_url
    assert_response :success
  end

end
