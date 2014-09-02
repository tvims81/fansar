class TeachersController < ApplicationController

	before_action :authenticate_user, only: [:show, :delete, :index, :destroy, :update, :update_password]
	before_action :authorize_teacher, only: [:destroy, :update, :update_password]
	before_action :set_teacher, only: [:destroy, :update, :show, :reset_password]

	def create
		@teacher = Users::TeacherRegistrationType.new(teacher_params)
		
		if @teacher.save
			UserMailer.confirmation_email(@teacher).deliver
			render :create, status: :created
		else
			render json: @teacher.errors, status: :unprocessable_entity
		end

	end

 

	def update
		@teacher = Users::TeacherUpdateType.find(params[:id])

    if @teacher.update_attributes(teacher_update_params)
			render :update
		else
			render :json => @teacher.errors.full_messages, status: :unprocessable_entity
		end

	end
	

	def show

	end

	def index
		@teachers = Teacher.all
		render :index
	end

	def destroy
		sign_out
		@teacher.destroy
	end

	def registration_confirm
		@teacher = Teacher.find(params[:id])
		if(@teacher.confirmation_token == params[:confirmation_token])
			@teacher.confirm
			render json: :nothing
		end
  end

  def reset_password
    if @teacher.reset_password_token == params[:reset_password_token]
      # меняем пароль на новый
      @teacher.password = SecureRandom.hex(4)
      @teacher.save
      UserMailer.new_password_email(@teacher).deliver
      render json: :nothing
    else
      render json: :nothing, status: :not_found
    end
  end

  def update_password
    @teacher = Users::TeacherPasswordUpdateType.find(params[:id])
    if @teacher.update_attributes(teacher_password_update_params)
      render json: :nothing
    else
      render json: @student.errors.full_messages, status: :unprocessable_entity
    end
  end

private
	
	def set_teacher
		@teacher = Teacher.find(params[:id])
	end

  def teacher_password_update_params
    params.require(:teacher).permit(:password, :password_confirmation)
  end

	def teacher_params
		params.require(:teacher).permit(:email, :password)
	end
	
	def teacher_update_params
		params.require(:teacher).permit(:name, :birthday, :surname, :middlename,
                                    :avatar, :phone, :city)
	end

end