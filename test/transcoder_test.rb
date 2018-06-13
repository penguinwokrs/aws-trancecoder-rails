# frozen_string_literal: true

require 'test_helper'

class Transcoder::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Transcoder
  end
end
