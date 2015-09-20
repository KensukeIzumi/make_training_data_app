class TrainingImage < ActiveRecord::Base
  mount_uploader :image,ImageUploader
end
