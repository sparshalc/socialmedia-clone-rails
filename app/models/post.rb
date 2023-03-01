class Post < ApplicationRecord
    validates :title,presence: true
    validates :image,presence: true
    
    belongs_to :user
    has_one_attached :image 
    has_many :comments,dependent: :destroy
end
