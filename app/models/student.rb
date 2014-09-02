class Student < ActiveRecord::Base

	before_save :confirmation_token_create
	has_secure_password
	mount_uploader :avatar, AvatarUploader

	


	has_many :homeworks, dependent: :destroy 
 	has_many :notices, as: :noticable, dependent: :destroy


 	has_many :subject_students
	has_many :subjects, through: :subject_students

	state_machine :initial => :inactive do

		state :active,:archived

		event :confirm do
      		transition :inactive => :active
    	end
		
		event :archive do
			transition :active => :archived
		end
	end


	private 
		def confirmation_token_create
			self.confirmation_token = SecureRandom.urlsafe_base64
		end
end
