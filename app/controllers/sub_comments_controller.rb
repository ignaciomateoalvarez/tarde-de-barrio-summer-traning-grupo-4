class SubCommentsController < ApplicationController
  before_action :set_comment, only: %i[create]
  before_action :set_student, only: %i[create]

  def create
    @sub_comment = @comment.sub_comments.create(body: params[:body], user_id: current_user.id,
                                                comment_id: @comment)
    redirect_to @student
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end
end
