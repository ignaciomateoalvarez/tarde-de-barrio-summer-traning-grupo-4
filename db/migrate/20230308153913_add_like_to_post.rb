class AddLikeToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, optional: true
  end
end
