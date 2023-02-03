class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, index: true
  end
end
