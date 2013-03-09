class AddIndexToStudentsStudentId < ActiveRecord::Migration
  def change
  	add_index :students, :student_id, unique: true
  end
end
