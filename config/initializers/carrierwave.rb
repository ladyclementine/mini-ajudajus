if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_KEY_ID'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :region                => 'sa-east-1'
    }
      config.fog_directory     =  'miniajudajus'
  end
end