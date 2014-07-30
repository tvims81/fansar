class Users::StudentUpdateType < Users::StudentType

	validates :name, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
  	message: "Имя может содержать только буквы" }

  validates :surname, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
    message: "Фамилия может содержать только буквы" }

  validates :middlename, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
    message: "Отчество может содержать только буквы" }

  validates_numericality_of :grade, { only_integer: true, :greater_than_or_equal_to => 5,
                                      :less_than_or_equal_to => 11 , message: "Классы с 5 по 11"}

  validates :city, format: { with: /\A[0-9a-zA-Zа-яА-Я ]+\z/,
      message: "Название города может содержать только буквы и цыфры" }

  validates :birthday, date: { message: "Неверный формат даты" }

  validates :school, format: { with: /\A[0-9a-zA-Zа-яА-Я ]+\z/,
                               message: "Название школы может содержать только буквы и цыфры" }

  validates :phone, format:  { with: /\A[0-9]+\z/, message: "Номер может сожержать только цифры" }
  validates :phone, length: { maximum: 10, minimum: 10, message: "Номер должен состоять из 10 цифр (без 8)" }

end