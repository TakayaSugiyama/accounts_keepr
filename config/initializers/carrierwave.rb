CarrirWave.configure do |config| 
  require 'carrirwave/storage/abstract'
  require 'carrirwave/storage/file'
  require 'carrirwave/storage/fog'

  config.storage :fog 
  config.for_provider = 'fog/aws'
  config.for_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:             true,
  }

  config.fog_public        = true 
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env? 
    when 'production'
      config.fog_directory = 'accountskeeper-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/accountskeeper-production'
  end

end