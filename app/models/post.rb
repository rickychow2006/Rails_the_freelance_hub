class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :service
    has_many :comments 
    has_many :users, through: :comments 

end
