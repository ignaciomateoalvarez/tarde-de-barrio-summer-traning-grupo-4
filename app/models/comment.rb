class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :sub_comments
  has_many :likes

  validates :body, presence: true

  def liked_by?(another_user)
    user.id == another_user.id
  end
end
