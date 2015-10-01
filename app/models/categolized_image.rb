class CategolizedImage < ActiveRecord::Base
  belongs_to :prepared_image 
  belongs_to :users

  has_many :evaluations , dependent: :destroy

  validates :name,
    uniqueness: {
    scope: [:prepared_image_id]
  },
    presence: true

  validates :start_x , numericality: true
  validates :start_y , numericality: true
  validates :end_x , numericality: true
  validates :end_y , numericality: true
end
