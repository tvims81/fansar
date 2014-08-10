class Users::AdminUpdateType < Users::AdminType

	validates :name, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
  	message: "Имя может содержать только буквы" }
    
end