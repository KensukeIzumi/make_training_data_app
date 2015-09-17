#coding: utf-8

class CategolizedImagesController < ApplicationController

def create
    @categolized_image = CategolizedImage.new
    @categolized_image.name = params[:name]
    @categolized_image.start_x = params[:start_x]
    @categolized_image.start_y = params[:start_y]
    @categolized_image.end_x = params[:end_x]
    @categolized_image.end_y = params[:end_y]
    @categolized_image.user_id = params[:user_id]
    @categolized_image.prepared_image_id = params[:prepared_image_id]

    user = User.find(params[:user_id])
    user.categolize_count = user.categolize_count + 1

    user.save
    @categolized_image.save

   
    redirect_to prepared_image_path(params[:prepared_image_id])
end  


def update   

  @categolized_image = CategolizedImage.find(params[:id])
  if (@categolized_image.user_id != current_user.id)
  @categolized_image.evaluation += 1 
  @categolized_image.user_id = current_user.id

  @categolized_image.save
  redirect_to prepared_image_path(@categolized_image.prepared_image_id)
  
  else
  redirect_to prepared_image_path(@categolized_image.prepared_image_id),:notice => "ご自分の分類は評価できません。"
  end

end

protect_from_forgery except: [:create, :new]

private
  def categolized_image_params
    params[:categolized_image].permit(:start_x,:start_y,:end_x,:end_y,:name,:user_id,:prepared_image_id)
  end
end
