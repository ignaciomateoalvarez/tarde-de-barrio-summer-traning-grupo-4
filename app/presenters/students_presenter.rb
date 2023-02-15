class StudentsPresenter

  include Pagy::Backend
  attr_reader :params

  def initialize(params:)
    @params = params
  end

  def students
    paginate unless @pagy.present?
    @students.decorate
  end

  def pagynate
    paginate unless @pagy.present?
    @pagy
  end

  def filter
    @filter ||= StudentFilter.new(Student.all.order(created_at: :desc), filter_params)
  end

  private

  def paginate
    @pagy, @students = pagy(filter.call)
  end

  def filter_params
    params.fetch(:student_filter, {}).permit(
      :query
    )
  end
end
