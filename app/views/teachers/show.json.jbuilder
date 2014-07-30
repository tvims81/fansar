json.extract! @teacher, :id, :name

if @teacher == current_user
	json.notices do
		@teacher.notices.each do |notice|
			json.text notice.text
		end
	end
end