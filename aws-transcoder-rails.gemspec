# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'aws-transcoder-rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'aws-transcoder-rails'
  s.version     = AwsTrancecoderRails::VERSION
  s.authors     = ['penguinwokrs']
  s.email       = ['dev.and.penguin@gmail.com']
  s.homepage    = 'https://github.com/penguinwokrs'
  s.summary     = 'AWS Elastic Transcoder Rails Library'
  s.description = 'AWS Elastic Transcoder Rails Library'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1', '>= 5.1.0'
  s.add_dependency 'aws-sdk-elastictranscoder', '1.0.0'
  s.add_development_dependency 'minitest', '~> 5.11', '>= 5.11.0'
end
