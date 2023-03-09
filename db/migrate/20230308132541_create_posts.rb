class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.boolean :highlight_post
      t.references :post, optional: true, foreign_key: true
      t.references :user, null: false

      t.timestamps
    end
  end
end
