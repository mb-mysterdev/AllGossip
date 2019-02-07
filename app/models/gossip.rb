class Gossip < ApplicationRecord
	validates :title, presence: true, length: { in: 3..25 }
	validates :content, presence: true
	belongs_to :user
	has_many :comments
	has_many :taggossips
	has_many :tags, through: :taggossips
	has_many :likes
end
