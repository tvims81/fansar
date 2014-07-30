class StudentSessionsController < ApplicationController

  def create
    	@student = Student.find_by_email(params[:email])
    	if @student && @student.authenticate(params[:password])
      		if @student.inactive?
      			render json: "Ошибка доступа, подтвердите аккаунт".to_json, status: :forbidden
      		else
      			student_sign_in @student
      			render :create, status: :created
      		end
    	else
      		render :json => "Ошибка, неверный пароль или логин".to_json, status: :unprocessable_entity
    	end
  end

  def forgot_password

    @student = Student.find_by_email(params[:email])

    if @student
      #зашифрованный токен для сброса пароля
      @student.update_attribute("reset_password_token", Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s))
      UserMailer.password_reset_email(@student).deliver
      render json: :nothing
    else
      render json: :nothing, status: :not_found
    end

  end

  def destroy
    sign_out
    render json: :nothing
  end

end