class EvaluationsController < ApplicationController
  def create

    @categolized_image = CategolizedImage.find(params[:categolized_image_id])
    @evaluation = Evaluation.new(user_id: current_user.id,categolized_image_id: @categolized_image.id )
    @prepared_image = PreparedImage.find(@categolized_image.prepared_image.id)
    @categolized_image.evaluation += 1
    @categolized_image.save
    if @evaluation.save
      redirect_to prepared_image_path(@prepared_image), notice: "分類を評価しました。"
    else
       redirect_to prepared_image_path(@prepared_image),alert: "この分類は評価できません。"
    end
  end


 def destroy
   @categolized_image =  CategolizedImage.find(params[:categolized_image_id])
   @prepared_image = PreparedImage.find(@categolized_image.prepared_image.id)
   @categolized_image.evaluation += -1
   @categolized_image.save
 
   evaluation = Evaluation.where("user_id = ? and categolized_image_id = ?",current_user.id,@categolized_image.id)
   @evaluation = evaluation[0]
   @evaluation.destroy


   redirect_to prepared_image_path(@prepared_image.id), notice: "評価を取り消しました。"
 end

end
