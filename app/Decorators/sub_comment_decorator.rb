class SubCommentDecorator < Draper::Decorator
  def format_date
    I18n.l(sub_comment.created_at.to_time, format: :day_month_date).capitalize
  end

  def format_time
    sub_comment.created_at.strftime('%H:%M')
  end
end
