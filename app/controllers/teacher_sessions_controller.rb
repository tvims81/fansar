class TeacherSessionsController < ApplicationController


  def forgot_password

    @teacher = Teacher.find_by_email(params[:email])

    if @teacher
      #зашифрованный токен для сброса пароля
      @teacher.update_attribute("reset_password_token", Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s))
        UserMailer.password_reset_email(@teacher).deliver
        render json: :nothing
      else
        render json: :nothing, status: :not_found
    end

  end


  def create
    @teacher = Teacher.find_by_email(params[:email])
    if @teacher && @teacher.authenticate(params[:password])
      	if @teacher.inactive?
      		render :json => "Ошибка доступа, подтвердите аккаунт".to_json, status: :forbidden
      	else
      		teacher_sign_in @teacher
      		render :create, status: :created
      	end
    else
      	render :json => "Ошибочка".to_json, status: :unprocessable_entity
    end
  end

  def destroy
  	sign_out
    render json: :nothing
  end

end
