class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完成しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new 
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger
end