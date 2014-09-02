class Teacher < ActiveRecord::Base
	
	before_save :confirmation_token_create
	has_secure_password
	mount_uploader :avatar, AvatarUploader


	has_many :lectures, dependent: :destroy
  has_many :homeworks, through: :lectures
  has_many :notices, as: :noticable, dependent: :destroy

  has_many :subject_teachers
	has_many :subjects, through: :subject_teachers

	has_many :students, through: :subjects


	state_machine :initial => :inactive do

		
		state :active,:archived

		event :confirm do
      		transition :inactive => :active
    	end
		
		event :archiving do
			transition :active => :archived
		end
		

	end

	private

		def confirmation_token_create
			self.confirmation_token = SecureRandom.urlsafe_base64
		end
end
