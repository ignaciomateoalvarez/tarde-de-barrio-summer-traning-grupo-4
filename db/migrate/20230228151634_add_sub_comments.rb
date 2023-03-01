class AddSubComments < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_comments do |t|
      t.string 'body', null: false
      t.timestamps
    end
    add_reference :sub_comments, :comment
    add_reference :sub_comments, :user
  end
end
