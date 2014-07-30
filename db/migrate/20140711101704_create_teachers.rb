class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, default: "Преподаватель"
      t.string :email
      t.string :password_digest
      t.string :confirmation_token
      t.string :state
      t.timestamps
    end
  end
end
