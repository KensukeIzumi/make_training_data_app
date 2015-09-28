class AdminHomeController < ApplicationController
  def index
    if !(current_user.admin?)
      redirect_to new_user_session_path , :notice  => "正規の画面よりご利用ください"
    end

    @reported_images = PreparedImage.where("delete_flag = ? ",1)

    evaluations = Evaluation.group("evaluated_user_id").sum(:evaluation)
    @top_evaluations = evaluations.sort_by{|key,val| -val}[0..4]

    @categolized_images = CategolizedImage.group("prepared_image_id").where.not(saved: 1)
    end
end
