class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end 
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :discription)
  end
  #ここから下、ログインしていないと投稿できない制限
  def authenticate_user
    if @current_user == nil
       flash[:notice] = "ログインが必要です"
       redirect_to("/login")
    end
  end
end
