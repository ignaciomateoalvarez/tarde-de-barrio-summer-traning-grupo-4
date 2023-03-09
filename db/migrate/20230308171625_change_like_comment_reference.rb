class ChangeLikeCommentReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :comment
    add_reference :likes, :comment, optional: true
  end
end
