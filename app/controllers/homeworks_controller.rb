class HomeworksController < ApplicationController

	before_action :authenticate_user
	before_action :homework_create_authorize, only: [:create]
	before_action :set_homework, only: [:update, :destroy, :rate]
	before_action :homework_destroy_and_update_authorize, only: [:destroy, :update]
	before_action :homework_rate_authorize, only: [:rate]

  after_action :calculate_average_score_and_homeworks_count, only: [:rate, :destroy] # homeworks helper


	def create
		@homework = HomeworkType.new(homework_params)
		@homework.lecture = Lecture.find(params[:lecture_id])
		@homework.student = current_user
		@homework.score = 0
		if @homework.save
			Notice.create_new_homework_notice_to_teacher(@homework)
			NoticeMailer.delay.homework_passed_email(@homework)
	    render :create, status: :created
		else
			render json: @homework.errors.full_messages, status: :unprocessable_entity
		end
	end 

	def destroy
		@homework.destroy
		render json: :nothing
	end

	def update
		if @homework.update_attributes(homework_params)
			Notice.create_homework_updated_notice_to_teacher(@homework)
			NoticeMailer.delay.homework_updated_email(@homework)
			render :update
		else
			render json: @homework.errors.full_messages, status: :unprocessable_entity
		end
	end

	def rate
		@homework.score = params[:score]
		if @homework.save
			Notice.create_homework_rated_notice_to_student(@homework)
			NoticeMailer.delay.homework_rated_email(@homework)
			render json: :nothing
		else
			render json: @homework.errors.full_messages, status: :unprocessable_entity
		end
	end


	private


		def set_homework
			@homework = HomeworkType.find(params[:id])
		end

		def homework_params
			params.require(:homework).permit( 
				documents_attributes: [:id, :file, :_destroy])
		end

end
