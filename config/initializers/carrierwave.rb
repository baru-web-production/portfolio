require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1',
      path_style: true
    }

    config.storage = :fog
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/hssb-portfolio-s3/'
    config.fog_directory = 'hssb-portfolio-s3'
    config.cache_storage = :fog
    # アクセスを許可する
    config.fog_public = false
    # fog-awsを使う
    config.fog_provider = 'fog/aws'
  end
end
