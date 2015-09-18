class CategolizedImage < ActiveRecord::Base
  belongs_to :prepared_image
  belongs_to :users

  has_many :evaluations , dependent: :destroy
end
