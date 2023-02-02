class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, :lastname, :email, presence: true
  validates_format_of :name, :lastname,
                      { with: /\z[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s[a-zA-ZÀ-ÿ\u00f1\u00d1])*[a-zA-ZÀ-ÿ\u00f1\u00d1]+\z/ }
  validates :email, uniqueness: true
  validates_format_of :email, { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
