class LectureUpdateAndCreateType < Lecture
	validates :name, format: { with: /\A[a-zA-Zа-яА-Я0-9]+\z/,
  	message: "Название может содержать только буквы" }

  	validates_associated :documents , { message: "  "}
	validates_associated :videos , { message: "  "}

end