class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  #validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/i }, length: {minimum:8, maximum: 32 }
  
  has_secure_password
  
  has_many :topics
end
