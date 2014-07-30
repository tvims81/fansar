class NoticeMailer < ActionMailer::Base
	default from: "fansarmailer@gmail.com"

  def homework_rated_email(homework)
		@homework = homework
		@lecture = homework.lecture
		@teacher = @lecture.teacher
		@student = homework.student

		mail(:to => @student.email,
			:subject => "Вашу домашнюю работу оценили")
	end

	def homework_passed_email(homework)
		@homework = homework
		@lecture = homework.lecture
		@teacher = @lecture.teacher
		@student = homework.student
		
		mail(:to => @teacher.email,
			:subject => "Прислано новое домашнее задание")
	end

	def homework_updated_email(homework)
		@lecture = homework.lecture
		@teacher = @lecture.teacher
		@student = homework.student

		mail(:to => @teacher.email,
			:subject => "Прислано измененное домашнее задание")
	end
	
	def new_lecture_email(lecture)
		@lecture = lecture
		@teacher = @lecture.teacher
		@subject = @lecture.subject
		@students = @subject.students

		@students.each do |student|
			mail(:to => student.email,
			:subject => "Новая лекция по предмету #{@subject.name}")
		end
	end
  
end
