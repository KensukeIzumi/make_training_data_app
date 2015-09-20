class TrainingImagesController < ApplicationController
  def new
    @training_image = TrainingImage.new
  end

  def create
    parameters = params[:training_image]
    url = parameters["url"]

    uploader = ImageUploader.new
    uploader.download! "#{url}"

    original = Magick::Image.read("#{Rails.root}/public#{uploader.image.url}").first

    w = params["end_x"].to_i - params["end_y"].to_i
    h = params["start_y"].to_i - params["start_x"].to_i
    image = original.crop(params["start_x"].to_i,params["start_y"].to_i,w,h)
    image.write("#{params["name"]}.jpg")

    uploader = ImageUploader.new
    uploader.download! image

    @training_image.image = uploader
    @training_image.name = "#{params["name"]}"

    @training_image.save

=begin
    training_image = Training_image.new
    training_image.image = uploader
    training_image.save

    @training_image = TrainingImage.new
    original = Magick::Image.read(params[:image_resource]).first
    image = original.crop(params[:start_x],params[:start_y],"#{params[:end_x]-params[:start_x]}","#{params[:start_y]-params[:end_y]}")
    image.write(@training_image)
=end
    redirect_to admin_home_index_path
  end

  def show
  end
end
