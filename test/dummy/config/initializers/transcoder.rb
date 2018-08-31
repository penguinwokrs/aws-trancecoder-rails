# frozen_string_literal: true

AwsTranscoderRails.configure do |config|
  config.pipeline_id = '1535719120170-28z47c'
  config.use_preset = [
    AwsTranscoderRails::HLS_400K,
    # AwsTranscoderRails::HLS_600K,
    # AwsTranscoderRails::HLS_1000K,
    # AwsTranscoderRails::HLS_1500K
  ].freeze
end
