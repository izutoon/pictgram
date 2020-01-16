class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  #helperの処理を重複して書かずにせず取り込む（Dry)
  helper_method :current_user, :logged_in?
  
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  #アクセス制限の処理
  def authenticate_user
    if @current_user == nil
       flash[:notice] = "ログインが必要です"
       redirect_to("/login")
    end
  end
end
