# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_student, only: %i[create destroy]
  before_action :set_publication, only: [:create]
  before_action :set_like, only: [:destroy]

  def create
    @publication.likes.create(user_id: current_user.id)
    redirect_to params[:student_id].nil? ? homes_path : student_path
  end

  def destroy
    @like.destroy
    redirect_to params[:student_id].nil? ? homes_path : student_path
  end

  private

  def set_student
    return unless params[:student_id]

    @student = Student.find(params[:student_id])
  end

  def set_publication
    if params[:comment_id]
      @publication = Comment.find(params[:comment_id])
    elsif params[:post_id]
      @publication = Post.find(params[:post_id])
    end
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
