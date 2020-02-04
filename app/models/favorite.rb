class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    #1人が１つの投稿に対して１つしかいいねをつけられないようにする
    #varidates_uniqueness_of :post_id, scope: user_id
end
