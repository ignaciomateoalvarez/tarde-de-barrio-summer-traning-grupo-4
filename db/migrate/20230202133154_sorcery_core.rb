class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: true, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :name, null: true
      t.string :lastname, null: true
      t.timestamps null: false
    end
  end
end

