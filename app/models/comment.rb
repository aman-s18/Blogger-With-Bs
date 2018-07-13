class Comment < ApplicationRecord
  belongs_to :blog
  has_many :replies
	has_many :likes, as: :likeable, dependent: :destroy
  
end
