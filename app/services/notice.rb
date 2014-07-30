class Notice < ActiveRecord::Base
	belongs_to :noticable, polymorphic: true
	
	state_machine :initial => :new do
	
		state :reviewed

		event :read do
      		transition :new => :reviewed
    	end

	end



	def self.create_new_lecture_notice_to_student(lecture)
		students = lecture.subject.students
		students.each do |student|
			student.notices.create(text: "появилась новая лекция #{lecture.name} по предмету #{lecture.subject.name}")
		end
	end

	def self.create_new_homework_notice_to_teacher(homework)
		homework.lecture.teacher.notices.create(text: "студент #{homework.student.name} сдал домашнюю работу 
			по лекции:#{homework.lecture.name}")
	end

	def self.create_homework_updated_notice_to_teacher(homework)
		homework.lecture.teacher.notices.create(text: "студент #{homework.student.name} обновил домашнюю работу 
			по лекции:#{homework.lecture.name}")
	end

	def self.create_homework_rated_notice_to_student(homework)
		homework.student.notices.create(text: "Вам поставили #{homework.score} баллов
		  за домашнюю работу по лекции: #{homework.lecture.name}")
	end

end
