class TrainingImagesController < ApplicationController
  def new
    @training_image = TrainingImage.new
  end

  def create
    parameters = params[:training_image]
    image_path = parameters[:image_path]

    original = Magick::Image.read("#{Rails.root}/public#{image_path}").first

    start_x = parameters["start_x"].to_i
    start_y = parameters["start_y"].to_i
    w = parameters["end_x"].to_i - start_x
    h = parameters["end_y"].to_i - start_y

    image = original.crop("#{start_x}".to_i,"#{start_y}".to_i,"#{w}".to_i,"#{h}".to_i)

    image.write("#{Rails.root}/app/assets/images/#{parameters["categolized_image_id"]}.jpg")

    @training_image = TrainingImage.new
    @training_image.image = File.open("#{Rails.root}/app/assets/images/#{parameters["categolized_image_id"]}.jpg")
    @training_image.name = "#{parameters["name"]}"

    @training_image.save
=begin
トリミングして保存された分類分けをマーキング、以降表示しないようにする。
=end
    @categolized_image = CategolizedImage.find("#{parameters["categolized_image_id"]}")
    @categolized_image.saved = 1
    @categolized_image.save
    redirect_to training_image_path(@training_image)
  end

  def show
  end
end
