class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :categolized_image


  validates :categolized_image,presence: true
  validates :user_id,uniqueness: { scope: :categolized_image_id}
  validates :user,presence: true
=begin
  def evaluated_by? user
    Evaluation.where(user.id: user_id).exist?
  end
=end
end
