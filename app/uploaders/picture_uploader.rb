# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  process :resize_to_limit => [500, 500]
  
  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
