class PreparedImagesController < ApplicationController

  def new
  end

  def create
    @prepared_image = PreparedImage.new
    @prepared_image.save
  end

  def show
    @prepared_image = PreparedImage.find(params[:id])

    @categolized_images = CategolizedImage.where("prepared_image_id = ?",params[:id])

    prepared_images = PreparedImage.where(["view_count < ? and delete_flag != ?",5,1])
    number = prepared_images.count
    random_number = rand(number)
    next_prepared_image = PreparedImage.where(["view_count < ? and delete_flag != ?",5,1]).limit(1).offset(random_number)
    @random_number = next_prepared_image[0].id    
  end

  def index 
    @prepared_image = prepared_images[number]
    #  @prepared_image.view_count += 1
    #  @prepared_image.save
    @random_number = number 
  end

  def destroy
    @prepared_image = PreparedImage.find(params[:id])

    filepath = @prepared_image.image.url

    if @prepared_image.destroy && File.delete("#{filepath}")
      redirect_to admin_home_index_path
    else 
      redirect_to admin_home_index_path
    end
  end

  private  
  def prepared_image_params
    params.require(:prepared_image).permit(:image,:image_resource,:view_count,:delete_flag)
  end
end
