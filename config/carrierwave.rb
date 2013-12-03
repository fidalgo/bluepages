CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.root = 'public/uploads'
  config.cache_dir = "cache"
end
