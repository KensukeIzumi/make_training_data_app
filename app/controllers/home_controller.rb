class HomeController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_home_index_path
    end

    @user = current_user
    #最初に渡す画像のIDをランダムで取得
    prepared_images = PreparedImage.where(["view_count < ? and delete_flag != ? ",5,1])
    number = prepared_images.count
    random_number = rand(number)

    prepared_image = PreparedImage.where(["view_count < ? and delete_flag != ?",5,1]).limit(1).offset(random_number)
    @prepared_image = prepared_image[0]

    #今月登録した枚数を取得
    if CategolizedImage.where(created_at: Time.now.all_month).where("user_id = ?", @user.id).empty?    
      your_categolized_images = {}
    elsif

      your_categolized_images = CategolizedImage.where(created_at: Time.now.all_month).where("user_id = ?", @user.id)
    end
    if Evaluation.where("evaluate_user_id = ?",@user.id).empty?
      your_evaluate_images = {}
    elsif
      your_evaluate_images = Evaluation.where("evaluate_user_id = ?",@user.id)
    end

    @your_count = your_categolized_images.count + your_evaluate_images.count
    #ユーザの評価を取得   
    if Evaluation.where("evaluated_user_id = ?",@user.id).count.nil?
      @your_evaluation = 0
    else
      @your_evaluation = Evaluation.where("evaluated_user_id = ?",@user.id).sum(:evaluation)
    end
    #今月の支払金を取得
    @your_salary = (@your_count + @your_evaluation)*10 
  end

  def show
  end
end
