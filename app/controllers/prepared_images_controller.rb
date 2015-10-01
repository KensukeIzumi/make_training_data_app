class PreparedImagesController < ApplicationController

  def new
  end

  def create
    @prepared_image = PreparedImage.new
    @prepared_image.save
  end

  def show
    if (current_user.admin?)
      redirect_to new_user_session_path , :notice  => "正規の画面よりご利用ください"
    end

    @prepared_image = PreparedImage.find(params[:id])

    #@prepared_image.view_count += 1
    #@prepared_image.save

    @categolized_images = CategolizedImage.where("prepared_image_id = ?",params[:id])

    prepared_images = PreparedImage.where(["view_count < ? and delete_flag != ?",5,1])
    number = prepared_images.count
    random_number = rand(number)
    next_prepared_image = PreparedImage.where(["view_count < ? and delete_flag != ?",5,1]).limit(1).offset(random_number)
    @random_number = next_prepared_image[0].id    
  end


  def destroy
    @prepared_image = PreparedImage.find(params[:id])
=begin
filepath = @prepared_image.image.url
File.delete("#{filepath}")
=end
    @prepared_image.destroy

    if params[:from]=='list'
      redirect_to :back
    else 
      redirect_to admin_home_index_path
    end
  end

  private  
  def prepared_image_params
    params.require(:prepared_image).permit(:image,:image_resource,:view_count,:delete_flag)
  end
end
