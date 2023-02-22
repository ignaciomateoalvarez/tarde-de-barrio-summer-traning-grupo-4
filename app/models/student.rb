class Student < ApplicationRecord
  belongs_to :user

  validates :name, :lastname, :birthdate, :address, :school_grade, presence: true
  validates_format_of :name, :lastname, { with: /\A[a-zA-ZÀ-ÖØ-öø-ÿ\s]+\z/ }
  validate :cant_be_future
  validates :active_student, inclusion: { in: [true, false] }

  enum school_grade: { Inicial: 0, Primaria: 1, Secundaria: 2 }

  def age
    age = (Date.today - self.birthdate)/365.25
    age.to_int
  end

  private

  def cant_be_future
    unless (birthdate.present? && !birthdate.future?)
      errors.add(:birthdate, I18n.t('models.student.error_date'))
    else
      true
    end
  end
end
