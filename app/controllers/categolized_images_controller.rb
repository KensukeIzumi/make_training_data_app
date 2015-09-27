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


    if @categolized_image.save
      redirect_to prepared_image_path(params[:prepared_image_id])
    else
      redirect_to prepared_image_path(params[:prepared_image_id]),alert: "履歴と重複しています。評価ボタンを押して次の分類を進めてください、なお評価した回数はそのままあなたの登録枚数に加算されます。"
    end 
  end


  protect_from_forgery except: [:create, :new]

  private
  def categolized_image_params
    params[:categolized_image].permit(:start_x,:start_y,:end_x,:end_y,:name,:user_id,:prepared_image_id)
  end
end
