# frozen_string_literal: true

require 'aws-transcoder-rails/config'
require 'aws-transcoder-rails/preset'

module AwsTranscoderRails
  class << self
    attr_writer :configuration,
                :client
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
