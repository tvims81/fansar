class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name, default: "Админушка"
      t.string :email
      t.string :password_digest
      t.string :confirmation_token

      t.timestamps
    end
  end
end
