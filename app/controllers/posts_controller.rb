# frozen_string_literal: true

class PostsController < ApplicationController
  def index; end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    @post.save
    redirect_to homes_path
  end

  private

  def post_params
    if params[:post_id].nil?
      params.require(:post).permit(:body, :highlight_post, :post_id, files: [])
    else
      params.permit(:body, :highlight_post, :post_id, files: [])
    end
  end
end
