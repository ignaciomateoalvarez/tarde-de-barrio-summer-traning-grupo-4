# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_student, only: %i[create destroy]
  before_action :set_comment, only: [:create]
  before_action :set_like, only: [:destroy]

  def create
    @comment.likes.create(user_id: current_user.id)
    redirect_to student_path(@student)
  end

  def destroy
    @like.destroy
    redirect_to student_path(@student)
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
