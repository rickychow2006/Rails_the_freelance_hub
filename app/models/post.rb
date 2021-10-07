class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :service
    has_many :user_favorites 
    has_many :users, through: :user_favorites 
end
