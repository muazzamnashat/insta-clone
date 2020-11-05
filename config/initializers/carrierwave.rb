#how to config the file >> https://rubydoc.info/gems/carrierwave/frames

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "Google",
    google_storage_access_key_id: "GOOGWWS2TBKOEU7TEOUD57ZJ",
    google_storage_secret_access_key: "yxECordPGE5OsySLphiscDoPrOGGXG7jfI0JCKr2",
  }
  config.fog_directory = "igram"
end
