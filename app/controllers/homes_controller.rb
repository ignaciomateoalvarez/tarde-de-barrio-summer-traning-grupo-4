# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @students = Student.all

    @posts = Post.all.order(created_at: :desc)
    @posts_highlighted = @posts.where(highlight_post: true).group_by do |c|
      c.created_at.to_date
    end
    @posts_not_highlighted = @posts.where(highlight_post: false).group_by do |c|
      c.created_at.to_date
    end
  end
end
