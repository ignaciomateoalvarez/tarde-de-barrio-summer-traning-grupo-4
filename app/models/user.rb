class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, :lastname, :email, presence: true
  validates_format_of :name, :lastname, { with: /\A[a-zA-ZñÑ\u00C0-\u017F']+[\s?[a-zA-ZñÑ\u00C0-\u017F']]\z/ }
  validates :email, uniqueness: true
  validates_format_of :email, { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: {admin:0, colab:1}

end
