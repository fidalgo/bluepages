require 'carrierwave'
require_relative '../config/carrierwave'

class DocumentUploader < CarrierWave::Uploader::Base
  storage :file
end
