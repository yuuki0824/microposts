class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  #has_many :like_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  
  def liking?(user)
    liking_users.include?(user)
  end
end
