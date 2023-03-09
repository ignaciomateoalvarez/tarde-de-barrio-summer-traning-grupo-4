class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: 'Post', optional: true
  has_many :children, class_name: 'Post', foreign_key: 'post_id'
  has_many :likes
  has_many_attached :files

  validates :body, presence: true
  validates :files, content_type: ['image/jpg', 'image/png', 'application/pdf', 'application/msword']

  def liked_by?(another_user)
    user.id == another_user.id
  end
end
