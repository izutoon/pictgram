class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  #アクセス制限の処理
  def authenticate_user
    if @current_user == nil
       flash[:notice] = "ログインが必要です"
       redirect_to("/login")
    end
  end
end
