class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :comment, optional: true
      t.references :user, null: false

      t.timestamps
    end
  end
end
