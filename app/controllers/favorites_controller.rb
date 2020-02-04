class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  #空のデータから取り出す
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
  
    if favorite.save
      redirect_to topics_path, success: 'いいねしました'
    else
      redirect_to topics_path, danger: 'いいねに失敗しました'
    end
  end
    
    #いいねを取り消す
    #既に存在するデータから削除する＝更新等も同じ書き方ができる
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if favorite.destroy
      redirect_to topics_path, success: 'いいねを取り消しました'
    else
      redirect_to topics_path, danger: 'いいねを取り消せませんでした'
    end
  end
 
end

