class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :text
      t.references :noticable, polymorphic: true
      t.string :state
      t.timestamps
    end
  end
end
