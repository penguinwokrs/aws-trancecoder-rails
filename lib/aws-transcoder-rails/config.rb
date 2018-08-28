# frozen_string_literal: true

module AwsTranscoderRails
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
      @segment_duration = 10
    end

    def to_credentials
      {
        region: region,
        access_key: access_key,
        secret_key: secret_key
      }
    end
  end
end
