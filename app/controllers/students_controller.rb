class StudentsController < ApplicationController
  before_action :ensure_frame_response, only: %i[new edit]
  before_action :set_student, only: %i[show edit update]
  before_action :require_login

  def index
    @presenter = StudentsPresenter.new(params:params)
    authorize Student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    if @student.save
      redirect_to students_path
    else
      flash.now[:notice] = @student.errors
      render :new
    end
  end

  def show; end

  def edit
    authorize @student
  end

  def update
    authorize @student
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :lastname, :address, :birthdate, :school_grade, :active_student)
  end

  def ensure_frame_response
    return unless Rails.env.development?
    redirect_to users_list_path unless turbo_frame_request?
  end

  def not_authenticated
    redirect_to new_session_path, error: t('.not_authenticated')
  end
end
