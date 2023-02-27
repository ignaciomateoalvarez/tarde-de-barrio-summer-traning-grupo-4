class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user

  validates :body, presence: true
end
