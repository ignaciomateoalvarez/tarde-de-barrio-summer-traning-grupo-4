class User < ApplicationRecord
  validates :name, :lastname, :email, presence: true
  validates_format_of :name, :lastname, { with: /\A[a-zA-Z]+\z/ }
  validates :email, uniqueness: true
  validates_format_of :email, { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end