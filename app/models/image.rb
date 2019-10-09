class Image < ApplicationRecord
  belongs_to :review
  mount_uploader :image, ImageUploader
end
