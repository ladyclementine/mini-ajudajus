if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => Rails.application.secrets.s3_access_key_id,
      :aws_secret_access_key => Rails.application.secrets.s3_secret_access_key,
      :region                => 'sa-east-1',
    }
    config.fog_directory     =>  :fog
  end
end