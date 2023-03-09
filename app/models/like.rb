class Like < ApplicationRecord
  belongs_to :comment, optional: true
  belongs_to :post, optional: true
  belongs_to :user

  validates :user_id, presence: true
end
