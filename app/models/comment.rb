class Comment < ApplicationRecord
	validates :content, presence: true, length: { minimum: 6 }
    belongs_to :gossip
	belongs_to :user
	has_many :likes
end
