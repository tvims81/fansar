json.extract! @student, :id, :name, :birthday

if @student == current_user
	json.notices do
		@student.notices.each do |notice|
			json.text notice.text
		end
	end
end