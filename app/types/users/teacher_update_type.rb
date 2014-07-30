class Users::TeacherUpdateType < Users::TeacherType

  validates :name, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
                             message: "Имя может содержать только буквы" }

  validates :surname, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
                                message: "Фамилия может содержать только буквы" }

  validates :middlename, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
                                   message: "Отчество может содержать только буквы" }

  validates :city, format: { with: /\A[0-9a-zA-Zа-яА-Я ]+\z/,
                             message: "Название города может содержать только буквы и цыфры" }

  validates :birthday, date: { message: "Неверный формат даты" }

  validates :phone, format:  { with: /\A[0-9]+\z/, message: "Номер может сожержать только цифры" }
  validates :phone, length: { maximum: 10, minimum: 10, message: "Номер должен состоять из 10 цифр (без 8)" }
  	

end