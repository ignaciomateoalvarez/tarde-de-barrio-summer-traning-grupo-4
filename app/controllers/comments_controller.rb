class CommentsController < ApplicationController
  before_action :set_student, only: %i[create]

  def create
    @comment = @student.comments.create(body: params[:body], user_id: current_user.id)
    redirect_to @student
  end

  def set_student
    @student = Student.find(params[:student_id])
  end
end
