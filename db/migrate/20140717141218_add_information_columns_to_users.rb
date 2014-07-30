class AddInformationColumnsToUsers < ActiveRecord::Migration
  def change

    add_column :teachers, :birthday, :date
    add_column :teachers, :phone, :string
    add_column :teachers, :city, :string
    add_column :teachers, :surname, :string
    add_column :teachers, :middlename, :string

    add_column :students, :birthday, :date
    add_column :students, :phone, :string
    add_column :students, :city, :string
    add_column :students, :surname, :string
    add_column :students, :middlename, :string

  end
end