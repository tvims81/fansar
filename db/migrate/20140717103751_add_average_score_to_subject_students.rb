class AddAverageScoreToSubjectStudents < ActiveRecord::Migration
  def change
    add_column :subject_students, :average_score, :integer, default: 0
  end
end
