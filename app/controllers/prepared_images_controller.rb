class PreparedImagesController < ApplicationController

def new
end

def create
  @prepared_image = PreparedImage.new
  @prepared_image.save
end

def show
  @prepared_image = PreparedImage.find(params[:id])

  @categolized_images = CategolizedImage.where("prepared_image_id = ?",params[:id]).group("name").order("evaluation DESC").uniq

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
=begin
def update
  @prepared_image = PreparedImage.find(params[:id])
  @prepared_image.reported_count += 1
  @prepared_image.save
  redirect_to prepared_image_path(params[:id])
end
=end
private  
  def prepared_image_params
    params.require(:prepared_image).permit(:image,:image_resource,:view_count,:delete_flag)
  end
end
