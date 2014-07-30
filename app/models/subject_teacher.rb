class SubjectTeacher < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :subject

	validates_uniqueness_of :teacher_id, scope: :subject_id, 
	message: "Вы уже выбрали этот предмет"
end
