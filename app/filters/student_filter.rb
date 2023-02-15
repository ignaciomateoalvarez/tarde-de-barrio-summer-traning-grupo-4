# frozen_string_literal: true

class StudentFilter
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :query, :string

  attr_reader :students

  def initialize(students, params)
    super(params)
    @students = students
  end

  def call
    by_query!
    students
  end

  def by_query!
    return if query.blank?
    @students = students.where('name ILIKE :query OR lastname ILIKE :query', query: "%#{query}%")
                  .or(students.where("name || ' ' || lastname ILIKE :query OR lastname || ' ' || name ILIKE :query",
                                  query: "%#{query}%"))
  end
end