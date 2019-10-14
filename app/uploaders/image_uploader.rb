class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  storage :file

  #サムネイル画像を作成する
  version :thumb do
    process resize_to_fill: [225, 215, "Center"]
  end  

  process resize_to_fill: [640, 410, "Center"]
  
  #受け付ける画像の最大サイズ
  process :resize_to_limit => [800,800]

  process :convert => 'jpg'

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  #これらの形式の画像しか受け付けない
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
