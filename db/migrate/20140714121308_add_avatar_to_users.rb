class AddAvatarToUsers < ActiveRecord::Migration
  def change
  	add_column :students, :avatar, :string
  	add_column :teachers, :avatar, :string
  end
end
