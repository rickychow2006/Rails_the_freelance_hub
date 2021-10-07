class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :userfavorites
    has_many :favorited_posts, through: :userfavorites, source: :post
    has_many :services, through: :posts
  
    has_secure_password 
    validates :username, :email, presence: true

    def favorite?(post)
        !!self.userfavorites.find_by(post: post)
    end 
end
