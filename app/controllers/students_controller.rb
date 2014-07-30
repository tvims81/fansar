class StudentsController < ApplicationController

	before_action :authenticate_user, only: [:show, :delete, :index, :destroy, :update, :update_password]
	before_action :set_student, only: [:show, :destroy, :registration_confirm, :reset_password]
	before_action :authorize_student, only: [:destroy, :update, :subscribe_to_subject, :update_password]





	def subscribe_to_subject
		@student.subjects << Subject.find(params[:subject_id])
		render json: :nothing
	end



	def create
		@student = Users::StudentRegistrationType.new(student_params)
		
		if @student.save
			UserMailer.confirmation_email(@student).deliver
			render :create, status: :created
		else
			render json: @student.errors.full_messages, status: :unprocessable_entity
		end

	end

	def update

		@student = Users::StudentUpdateType.find(params[:id])
		
		if @student.update_attributes(student_update_params)
			render :update
		else
			render json: @student.errors.full_messages, status: :unprocessable_entity
		end

	end

	def destroy
		sign_out 
		@student.destroy
	end

	def show
	
	end

	def index
  		@search = Student.search(params[:q])
  		@students = @search.result
  		@search.build_condition if @search.conditions.empty?
  		@search.build_sort if @search.sorts.empty?
	end

  def reset_password
    if @student.reset_password_token == params[:reset_password_token]
      # меняем пароль на новый
      @student.password = SecureRandom.hex(4)
      @student.save
      UserMailer.new_password_email(@student).deliver
      render json: :nothing
    else
      render json: :nothing, status: :not_found
    end
  end

	def registration_confirm
		if(@student.confirmation_token == params[:confirmation_token])
			@student.confirm
      render json: :nothing
    else
      render json: :nothing, status: :not_found
		end
  end

  def update_password
    @student = Users::StudentPasswordUpdateType.find(params[:id])
    if @student.update_attributes(student_password_update_params)
      render json: :nothing
    else
      render json: @student.errors.full_messages, status: :unprocessable_entity
    end
  end



  private

		def set_student
			@student = Student.find(params[:id])
		end

		def student_params
			params.require(:student).permit(:email, :password)
		end

    	def student_password_update_params
      		params.require(:student).permit(:password, :password_confirmation)
    	end

		def student_update_params
			params.require(:student).permit(:name, :birthday, :surname, :middlename,
          :avatar, :phone, :city, :grade, :school)
		end

end
