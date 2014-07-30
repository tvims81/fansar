class AddRestPaswordTokenToUsers < ActiveRecord::Migration
  def change
    add_column :teachers, :reset_password_token, :string
    add_column :students, :reset_password_token, :string
  end
end
