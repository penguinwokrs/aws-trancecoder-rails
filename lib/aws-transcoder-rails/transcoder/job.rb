# frozen_string_literal: true

require 'digest'
require 'aws-sdk-elastictranscoder'

module AwsTranscoderRails
  module Transcoder
    class Job

      attr_reader :credentials,
                  :pipeline


      attr_accessor :segment_duration,
                    :outputs,
                    :path,



                    def self.create(input_key)
                      new.create(input_key)
                    end

      def initialize
        @credentials = AwsTranscoderRails.configuration.to_credentials
        @segment_duration = AwsTranscoderRails.configuration.segment_duration
        @pipeline = AwsTranscoderRails.configuration.pipeline_id
        @output_key_prefix = AwsTranscoderRails.configuration.output_key_prefix
        @use_preset = AwsTranscoderRails.configuration.use_preset
      end

      def create(input_key, options = {})
        @path = Pathname.new input_key
        input = {key: path.to_s}
        filename = File.basename(path.basename, File.extname(path.basename))
        # current_pipeline = if options[:pipeline_id].present?
        #                      options[:pipeline_id]
        #                    else
        #                      pipline
        #                    end

        client.create_job(
          pipeline_id: pipeline,
          input: input,
          output_key_prefix: "#{@output_key_prefix}#{path.dirname}/",
          outputs: asset_preset(filename),
          playlists: [asset_playlist(filename)]
        )[:job]
      end


      def asset_preset(input_key)
        @use_preset.map do |input_preset|
          preset = input_preset
          preset.merge(key: "#{preset[:key]}#{input_key}", segment_duration: segment_duration)
        end
      end

      # @param [string] input_key
      # @return [hash]
      #
      # name is playlist name.
      # out_put_keys is dirname
      def asset_playlist(input_key)
        {
          name: "hls_#{input_key}",
          format: 'HLSv3',
          output_keys: asset_preset(input_key).map {|output| output[:key]}
        }
      end

      def client
        config = AwsTranscoderRails.configuration.to_credentials.compact
        @client ||= config.present? ? Aws::ElasticTranscoder::Client.new(config) : Aws::ElasticTranscoder::Client.new
      end

      # def pipline
      #   AwsTranscoderRails.configuration.pipeline_id
      # end

      def find_pipline_name(name)
        client.pipelines.find {|k| k.name == name}
      end

      def find_pipline_name?(name)
        ! find_pipline_name(name).nil?
      end

      def output_key(input_key)
        Digest::SHA256.hexdigest(input_key.encode('UTF-8'))
      end
    end
  end
end
