class PreparedImage < ActiveRecord::Base
  attr_accessor :image
  mount_uploader :image, ImageUploader

  has_many :categolized_images
  has_many :reports,dependent: :destroy

end
