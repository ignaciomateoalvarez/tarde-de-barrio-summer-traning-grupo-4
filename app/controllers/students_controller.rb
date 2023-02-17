class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit]

  def index
    @presenter = StudentsPresenter.new(params:params)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      flash.now[:notice] = @student.errors
      render :new
    end
  end

  def show; end

  def edit; end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :lastname, :address, :birthdate, :school_grade, :active_student)
  end
end
