require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contents_create_url
    assert_response :success
  end

end
