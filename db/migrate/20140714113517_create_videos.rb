class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :lecture_id
      t.text :code
      t.timestamps
    end
  end
end
