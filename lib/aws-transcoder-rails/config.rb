# frozen_string_literal: true

require 'digest'

module AwsTranscoderRails
  # Handles the configuration object. Check out {FirebaseIdToken} for more
  # info on how to use it.
  LIB_PATH = File.expand_path('../../', __FILE__)

  class Configuration
    attr_accessor :region,
                  :segment_duration,
                  :pipeline_id,
                  :access_key,
                  :secret_key,
                  :output_key_prefix,
                  :use_preset

    def initialize
      @region = 'us-east-1'
      @segment_duration = 10
    end
  end
end
