class EvaluationsController < ApplicationController
  def create
    @categolized_image = CategolizedImage.find(params[:categolized_image_id])
    @prepared_image = PreparedImage.find(@categolized_image.prepared_image_id)
    if (@categolized_image.user_id != current_user.id)
      @evaluation = Evaluation.new(evaluate_user_id: current_user.id,evaluated_user_id:@categolized_image.user_id,categolized_image_id: @categolized_image.id,evaluation: "#{params[:evaluation]}")

      if @evaluation.save
        redirect_to prepared_image_path(@prepared_image.id), notice: "分類を評価しました。"
      else
        redirect_to prepared_image_path(@prepared_image.id),alert: "この分類は評価できません。"
      end
    else
      redirect_to prepared_image_path(@prepared_image.id),:notice => "ご自分の分類は評価できません。"
    end
  end


  def destroy
    @categolized_image =  CategolizedImage.find(params[:categolized_image_id])
    @prepared_image = PreparedImage.find(@categolized_image.prepared_image.id)

    evaluation = Evaluation.where("evaluate_user_id = ? and categolized_image_id = ?",current_user.id,@categolized_image.id)
    @evaluation = evaluation[0]
    @evaluation.destroy

    redirect_to prepared_image_path(@prepared_image.id), notice: "評価を取り消しました。"
  end

end
