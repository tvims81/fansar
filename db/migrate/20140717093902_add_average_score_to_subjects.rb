class AddAverageScoreToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :average_score, :integer, default: 0
  end
end
