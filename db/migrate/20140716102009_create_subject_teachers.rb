class CreateSubjectTeachers < ActiveRecord::Migration
  def change
    create_table :subject_teachers do |t|
      t.belongs_to :teacher
      t.belongs_to :subject
      t.timestamps
    end
  end
end
