class ChangeColumnOnTableName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, null: false
    change_column_null :users, :lastname, null: false
    change_column_null :users, :email, null: false
  end
end
