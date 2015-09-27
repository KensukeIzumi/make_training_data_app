class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :categolized_image

=begin
  validates :categolized_image,presence: true
  validates :evaluate_user_id,uniqueness: { scope: :categolized_image_id}
  validates :user,presence: true
=end
=begin
  def evaluated_by? user
    Evaluation.where(user.id: user_id).exist?
  end
=end
end
