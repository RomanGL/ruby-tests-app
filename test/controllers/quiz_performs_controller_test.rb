require 'test_helper'

class QuizPerformsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_performs_index_url
    assert_response :success
  end

end
