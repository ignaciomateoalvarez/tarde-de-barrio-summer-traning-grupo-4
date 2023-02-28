# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :students

  validates :name, :lastname, :email, presence: true
  validates_format_of :name, :lastname, { with: /\A[a-zA-ZÀ-ÖØ-öø-ÿ\s]+\z/ }
  validates :email, uniqueness: true
  validates_format_of :email, { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  enum role: { admin: 0, colaborador: 1 }

  def full_name
    name + ' ' + lastname
  end
end
