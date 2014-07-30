class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
 	    t.string :name, default: "Ученик"
      t.string :email
      t.string :password_digest
      t.string :confirmation_token
      t.string :state
      t.integer :grade, default: 9
      t.timestamps
    end
  end
end
