require 'test_helper'

class ContentsControllerTest < ActionController::TestCase

  setup do
    @file = file_fixture('trailer_1080p.mp4')
  end

  test 'should job create' do
    post :create
    assert_response :success
  end
end
