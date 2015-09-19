class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :prepared_image


  validates :user,presence: true
  validates :prepared_image,presence: true
  validates :user_id, uniqueness: {scope: :prepared_image_id}

end
