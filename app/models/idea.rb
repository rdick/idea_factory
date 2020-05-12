class Idea < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    belongs_to :user
    
    has_many :reviews
    has_many :likes
    has_many :likers, through: :likes, source: :user
end
