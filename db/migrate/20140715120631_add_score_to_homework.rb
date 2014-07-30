class AddScoreToHomework < ActiveRecord::Migration
  def change
  	add_column :homeworks, :score, :integer
  end
end
