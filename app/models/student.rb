class Student < ApplicationRecord
  validates :name, :lastname, :email, :birthdate, :address, :school_grade, presence: true
  validates_format_of :name, :lastname, { with: /\A[a-zA-ZñÑ\u00C0-\u017F']+[\s?[a-zA-ZñÑ\u00C0-\u017F']]\z/ }
  validates_format_of :email, { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :cant_be_future
  validates :active_student, inclusion: { in: [true, false] }

  enum school_grade: { Inicial: 0, Primaria: 1, Secundaria: 2 }

  def age
    age = (Date.today - self.birthdatete)/365.25
    age.to_int
  end

  private

  def cant_be_future
    unless (birthdate.present? && !birthdate.future?)
      errors.add(:birthdate, "Date can't be future")
    else
      true
    end
  end
end
