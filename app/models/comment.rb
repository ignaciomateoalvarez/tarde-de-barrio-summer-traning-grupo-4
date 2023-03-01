class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :sub_comments

  validates :body, presence: true
end
