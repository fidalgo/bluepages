CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.root = '/tmp'
  config.cache_dir = "uploads"
end
