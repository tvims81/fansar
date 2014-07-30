class AddUniqueIndexToSubjectUsers < ActiveRecord::Migration
  def change
  	add_index :subject_teachers, [ :subject_id, :teacher_id ], :unique => true
  	add_index :subject_students, [ :subject_id, :student_id ], :unique => true
  end
end
