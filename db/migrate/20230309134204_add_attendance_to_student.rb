class AddAttendanceToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :attendance, :integer
  end
end
