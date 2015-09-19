class AdminHomeController < ApplicationController
  def index
    if !(current_user.admin?)
      redirect_to new_user_session_path , :notice  => "正規の画面よりご利用ください"
    end
  end

  def show
  end
end
