class NoticesController < ApplicationController

	before_action :authenticate_user
	before_action :set_notice
	before_action :notice_destroy_and_read_authorize

	def destroy
		@notice.destroy
		render json: :nothing
	end

	def read
		@notice.read
		render json: :nothing
	end

	private
		
		def set_notice
			@notice = Notice.find(params[:id])
		end

end
