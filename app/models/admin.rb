class Admin < ActiveRecord::Base
	before_save :confirmation_token_create
	has_secure_password
	mount_uploader :avatar, AvatarUploader

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
