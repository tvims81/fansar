class Users::TeacherPasswordUpdateType < Users::TeacherType

  validates :password, length: { in: 6..20, message: "Пароль должен содержать от 6 до 20 символов" }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/,
                                 message: "Пароль может содержать только[en] буквы и цифры" }

  validates :password, confirmation: true



end