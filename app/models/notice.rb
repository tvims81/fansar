class Notice < ActiveRecord::Base
	belongs_to :noticeble, polymorphic: true
	
end
