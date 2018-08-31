# frozen_string_literal: true

module AwsTranscoderRails
  HLS_AUDIO_64K = {
    preset_id: '1351620000001-200071',
    key: 'hls_audio_64k/'
  }.freeze
  HLS_400K = {
    preset_id: '1351620000001-200050',
    key: 'hls_400k/'
  }.freeze
  HLS_600K = {
    preset_id: '1351620000001-200040',
    key: 'hls_600k/'
  }.freeze
  HLS_1000K = {
    preset_id: '1351620000001-200030',
    key: 'hls_1000k/'
  }.freeze
  HLS_1500K = {
    preset_id: '1351620000001-200020',
    key: 'hls_1000k/'
  }.freeze

  # HLS_2000K = '1351620000001-200010'
  # MPEG_DASH_128K_AUDIO = '1351620000001-500060'
  # MPEG_DASH_600K = '1351620000001-500050'
  # MPEG_DASH_1200K = '1351620000001-500040'
  # MPEG_DASH_2400K = '1351620000001-500030'
  # MPEG_DASH_4800K = '1351620000001-500020'
end
