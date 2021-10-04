class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post
    has_secure_password 
    has_many :services, through: :posts
  
    validates :username, :email, presence: true
end
