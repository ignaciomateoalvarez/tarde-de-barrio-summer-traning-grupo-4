class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :sub_comments
  has_many :likes
  has_many_attached :files

  validates :body, presence: true
  validates :files, content_type: ['image/jpg', 'image/png', 'application/pdf', 'application/msword']

  def liked_by?(another_user)
    user.id == another_user.id
  end
end
