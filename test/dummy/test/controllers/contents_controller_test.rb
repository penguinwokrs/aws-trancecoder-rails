require 'test_helper'

class ContentsControllerTest < ActionController::TestCase
  test 'should job create' do
    post :create
    assert_response :success
  end
end
