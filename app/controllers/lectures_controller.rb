class LecturesController < ApplicationController

	before_action :authenticate_user
	before_action :set_lecture, only: [:show, :update, :destroy]
	before_action :lecture_create_authorize, only: [:create]
	before_action :lecture_destroy_and_update_authorize, only: [:update, :destroy]


	def create
		@lecture = LectureType.new(lecture_params)
		@lecture.teacher = current_user
		if @lecture.save
			Notice.create_new_lecture_notice_to_student(@lecture)
			NoticeMailer.new_lecture_email(@lecture).deliver
			render :create, status: :created
		else
			render json: @lecture.errors.full_messages, status: :unprocessable_entity
		end
	end



	def update
		if @lecture.update_attributes(lecture_params)
			render :update
		else
			render json: @lecture.errors.full_messages, status: :unprocessable_entity
		end
	end

	def show
		render :show
	end

	def destroy
		@lecture.destroy
		render :destroy
	end

	def index
		@lectures = Lecture.all
		render :index
	end




	private 



		def set_lecture
			@lecture = LectureType.find(params[:id])
		end


		def lecture_params
			params.require(:lecture).permit(:name, :subject_id,
				documents_attributes: [:id, :file, :_destroy],
				videos_attributes: [:id, :code, :_destroy])
		end

end
