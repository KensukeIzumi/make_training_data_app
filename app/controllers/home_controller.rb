class HomeController < ApplicationController
  def index
    @user = current_user
#ここで最初に渡す画像のIDをランダムで取得
    prepared_images = PreparedImage.where(["view_count < ? and reported_count != ? ",5,5])
    number = prepared_images.count
    random_number = rand(number)

    prepared_image = PreparedImage.where(["view_count < ? and reported_count < ?",5,5]).limit(1).offset(random_number)
    @prepared_image = prepared_image[0]
    
#今月登録した枚数を取得
    if CategolizedImage.where(created_at: Time.now.all_month).where("user_id = ?", @user.id).empty?
    your_categolized_images = {}
    else
    your_categolized_images = CategolizedImage.where(created_at: Time.now.all_month).where("user_id = ?", @user.id)
    end
    @your_count = your_categolized_images.count
#ユーザの評価を取得   
    if CategolizedImage.where("user_id = ?",@user.id).group(:user_id).sum(:evaluation).empty?
    your_evaluation = {@user.id => 0}
    else
    your_evaluation = CategolizedImage.where("user_id = ?",@user.id).group(:user_id).sum(:evaluation)
    end
    @your_evaluation = your_evaluation[@user.id]
#今月の支払金を取得
    @your_salary = (@your_count + @your_evaluation)*10 
  end

  def show
  end
end
