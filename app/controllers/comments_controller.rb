class CommentsController < ApplicationController
  before_action :set_student, only: %i[create]

  def create
    @comment = @student.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @student
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :highlight_comment, files: [])
  end
end
