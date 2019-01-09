require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found_forbidden_internal_server_error" do
    get errors_not_found_forbidden_internal_server_error_url
    assert_response :success
  end

end
