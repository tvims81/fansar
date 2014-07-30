class AddHomewroksCountToSubjectStudents < ActiveRecord::Migration
  def change
    add_column :subject_students, :homeworks_count, :integer, default: 0
  end
end
