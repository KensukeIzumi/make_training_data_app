class ReportsController < ApplicationController
  def create

    @prepared_image = PreparedImage.find(params[:prepared_image_id])
    @report = Report.new(user_id: current_user.id,prepared_image_id: @prepared_image.id )

    if @prepared_image.reports.count >= 5
      @prepared_image.delete_flag = 1
    else
      @prepared_image.delete_flag = 0
    end

      @prepared_image.save

    if @report.save
      redirect_to prepared_image_path(@prepared_image), notice: "報告しました。"
    else
       redirect_to prepared_image_path(@prepared_image),alert: "既に報告された画像です。"
    end
  end


 def destroy
   @prepared_image =  PreparedImage.find(params[:prepared_image_id])

   if @prepared_image.reports.count >= 5
      @prepared_image.delete_flag = 1
   else
      @prepared_image.delete_flag = 0
   end

   @prepared_image.save

   report = Report.where("user_id = ? and prepared_image_id = ?",current_user.id,@prepared_image.id)
   @report = report[0]
   @report.destroy

   redirect_to prepared_image_path(@prepared_image.id), notice: "報告を取り消しました。"
 end
 
end
