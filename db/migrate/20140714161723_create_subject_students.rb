class CreateSubjectStudents < ActiveRecord::Migration
  def change
    create_table :subject_students do |t|
      t.belongs_to :student
      t.belongs_to :subject
      t.timestamps
    end
  end
end
