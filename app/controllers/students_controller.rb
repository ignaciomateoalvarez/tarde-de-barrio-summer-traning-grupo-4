class StudentsController < ApplicationController
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

  private

  def student_params
    params.require(:student).permit(:name, :lastname, :address, :birthdate, :school_grade, :active_student)
  end
end
