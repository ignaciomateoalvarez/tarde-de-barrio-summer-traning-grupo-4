class Student < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :name, :lastname, :birthdate, :address, :school_grade, presence: true
  validates_format_of :name, :lastname, { with: /\A[a-zA-ZÀ-ÖØ-öø-ÿ\s]+\z/ }
  validate :cant_be_future
  validates :active_student, inclusion: { in: [true, false] }

  enum school_grade: { Inicial: 0, Primaria: 1, Secundaria: 2 }
  enum attendance: { presente: 0, ausente: 1, retirado: 2 }

  scope :count_attendance_type, ->(value) { where(attendance: value).count }

  def age
    age = (Date.today - birthdate) / 365.25
    age.to_int
  end

  def self.highlight_post_count
    Post.where(highlight_post: true).count
  end

  private

  def cant_be_future
    if birthdate.present? && !birthdate.future?
      true
    else
      errors.add(:birthdate, I18n.t('models.student.error_date'))
    end
  end
end
