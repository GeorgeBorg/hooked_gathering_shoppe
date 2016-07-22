CarrierWave.configure do |cfg|
    cfg.storage = :fog
    cfg.fog_credentials = {
      :provider               => 'AWS',
      :region                 => ENV['aws_region'],
      :aws_access_key_id      => ENV['aws_access_key_id'],
      :aws_secret_access_key  => ENV['aws_secret_access_key'],
    }
    cfg.fog_directory  = ENV["aws_bucket"]
    cfg.fog_public     = true
    cfg.fog_attributes = {'Cache-Control'=>'max-age=315576000'}

  cfg.enable_processing = !Rails.env.test?
end