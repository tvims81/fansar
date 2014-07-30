class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :student_id
      t.integer :lecture_id
      t.timestamps
    end
  end
end
