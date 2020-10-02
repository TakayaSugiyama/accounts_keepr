# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  elsif Rails.env.development?
    storage :file
  end

  # サムネイル画像を作成する
  version :thumb do
    process resize_to_fill: [225, 215, 'Center']
  end

  process resize_to_fill: [640, 410, 'Center']

  # 受け付ける画像の最大サイズ
  process resize_to_limit: [800, 800]

  # すべての画像をjpg形式へ
  process convert: 'jpg'

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # これらの形式の画像しか受け付けない
  def extension_whitelist
    %w[jpg jpeg png]
  end

  # ファイル名を変更する
  def filename
    time = Time.zone.now
    name = "#{time.strftime('%Y%m%d')}.jpg"
    name.downcase
  end
end
