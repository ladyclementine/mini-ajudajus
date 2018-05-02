CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage :file
    config.asset_host = 'http://localhost:3000'
  else
    config.storage = :fog
    config.fog_use_ssl_for_aws = true
    config.fog_directory  = 'miniajudajus'
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control': 'max-age=315576000' }

    config.fog_credentials = {
      :provider =>               'AWS'
      :aws_access_key_id =>      Rails.application.secrets.s3_access_key_id,  
      :aws_secret_access_key =>  Rails.application.secrets.s3_secret_access_key, 
    }
  end
end