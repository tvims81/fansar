class AddUniqueIndexToHomework < ActiveRecord::Migration
  def change
  	add_index :homeworks, [ :lecture_id, :student_id ], :unique => true
  end
end
