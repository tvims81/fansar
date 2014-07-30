class HomeworkType < Homework

	validate :lecture_id, presence: { message: "Домашняя работа должна принадлежать лекции" }
	validate :student_id, presence: { message: "Домашняя работа должна принадлежать студенту "}

  validates_uniqueness_of :student_id, scope: :lecture_id,
	message: "Вы уже сдавали домашнее задание для этой лекции"

  validates_associated :documents, { message: ""}


  validates_numericality_of :score, { only_integer: true, :greater_than_or_equal_to => 0,
	 :less_than_or_equal_to => 100 }

end