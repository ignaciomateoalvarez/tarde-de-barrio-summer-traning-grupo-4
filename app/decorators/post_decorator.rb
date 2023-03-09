class PostDecorator < Draper::Decorator
  def format_date
    I18n.l(post.created_at.to_time, format: :day_month_date).capitalize
  end

  def format_time
    post.created_at.strftime('%H:%M')
  end
end
