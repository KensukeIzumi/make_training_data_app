#coding: utf-8

class CategolizedImagesController < ApplicationController

  def create
    if (current_user.admin?)
      redirect_to new_user_session_path , :notice  => "正規の画面よりご利用ください"
    end

    @categolized_image = CategolizedImage.new
    @categolized_image.name = params[:name]
    @categolized_image.start_x = params[:start_x]
    @categolized_image.start_y = params[:start_y]
    @categolized_image.end_x = params[:end_x]
    @categolized_image.end_y = params[:end_y]
    @categolized_image.user_id = params[:user_id]
    @categolized_image.prepared_image_id = params[:prepared_image_id]

    if @categolized_image.save
      redirect_to prepared_image_path(params[:prepared_image_id])
    elsif @categolized_image.errors.any?
      error_messages = Array.new
      error_max_index = @categolized_image.errors.count - 1
      @categolized_image.errors.full_messages.each do |msg|
        error_messages.push("#{msg}")
      end
      redirect_to prepared_image_path(params[:prepared_image_id]),alert: "#{error_messages[0..error_max_index ]}"
    end 
  end

  def show 
    @categolized_image = CategolizedImage.find(params[:id])
  end


  protect_from_forgery except: [:create, :new]

  private
  def categolized_image_params
    params[:categolized_image].permit(:start_x,:start_y,:end_x,:end_y,:name,:user_id,:prepared_image_id)
  end
end
