# frozen_string_literal: true

# FIXME: 警告が発生 => warning: already initialized constant Digest::REQUIRE_MUTEX
# FIXME: requireすることで発生している。
require 'Digest'

module Transcoder
  class << self
    attr_accessor :region,
                  :segment_duration,
                  :pipeline_id,
                  :access_key,
                  :secret_key,
                  :output_key_prefix,
                  :use_preset

    def output_key(input_key)
      Digest::SHA256.hexdigest(input_key.encode('UTF-8'))
    end
  end

  self.region = 'us-east-1'
  self.segment_duration = 10
  self.pipeline_id = '1512644951004-mem7t0'
end
