class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def is_liked(comment)
 if Like.where(:likeable => comment ,:user_id => self.id).present?
 Like.where(:likeable => comment ,:user_id => self.id).last.like==true
 end
 end
 def is_disliked(comment)
 if Like.where(:likeable => comment ,:user_id => self.id).present?
 Like.where(:likeable => comment ,:user_id => self.id).last.like==false
 end
 end
 def self.find_comment(id, type)
 comment= type.constantize.find(id)
 return comment
 end
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
