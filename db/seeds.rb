# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SUBJECTS
	subject_names = ["Математика", "Физика"]

	subject_names.each do |subject_name|
		Subject.create(name: subject_name)
	end


# Teacher
	
	@teacher = Teacher.new(email: "1nsaf@mail.ru", password: "111111")
	@teacher.confirm
	@teacher.save


# Student
	
	@student = Student.new(email: "florentiyy@gmail.com", password: "111111")
	@student.confirm
	@student.save
