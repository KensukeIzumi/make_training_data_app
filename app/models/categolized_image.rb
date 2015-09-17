class CategolizedImage < ActiveRecord::Base
  belongs_to :prepared_image
  belongs_to :users
end
