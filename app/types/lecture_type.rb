class LectureType < Lecture

    validates :name, format: { with: /\A[a-zA-Z0-9а-яА-Я ]+\z/,
  	message: "Название может содержать только буквы и цифры" }

  	validate :subject_id, prеsence: { message: "Лекция должна быть прикреплена к предмету"}
  	validate :teacher_id, prеsence: { message: "Лекция должна быть прикреплена к лектору"}

    validates_associated :documents , { message: ""}
    validates_associated :videos , { message: ""}

end