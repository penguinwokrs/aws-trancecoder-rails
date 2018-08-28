# frozen_string_literal: true

require 'digest'
require 'aws-sdk-elastictranscoder'

module AwsTranscoderRails
  class Job
    attr_reader :outputs

    def self.create(input_key)
      new.create(input_key)
    end

    def initialize;
    end

    def create(input_key)
      return
      input = {key: input_key}

      client.job(
        pipeline_id: pipeline_id,
        input: input,
        output_key_prefix: "#{output_key_prefix}#{output_key(input_key)}/",
        outputs: preset(input_key),
        playlists: [playlist(input_key)]
      )[:job]
    end


    def preset(input_key)
      use_preset.map do |input_preset|
        preset = const_get(input_preset)
        preset.merge(key: "#{preset[:key]}#{output_key(input_key)}", segment_duration: segment_duration)
      end
    end

    def playlist(input_key)
      {
        name: 'hls_' + output_key(input_key),
        format: 'HLSv3',
        output_keys: create_preset(input_key).map {|output| output[:key]}
      }
    end

    def client
      config = configuration.to_credentials.compact
      @client ||= config.present? ? Aws::ElasticTranscoder::Client.new(config) : Aws::ElasticTranscoder::Client
    end


    def output_key(input_key)
      Digest::SHA256.hexdigest(input_key.encode('UTF-8'))
    end
  end
end
