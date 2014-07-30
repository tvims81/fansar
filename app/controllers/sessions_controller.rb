class SessionsController < ApplicationController




  	def create
    	teacher = Teacher.find_by_email(params[:email])
    	if teacher && teacher.authenticate(params[:password])
      		if teacher.inactive?
      			render :json => "Ошибка доступа, подтвердите аккаунтz".to_json, status: :redirect
      		else
      			teacher_sign_in teacher
      			render :create, status: :success
      		end
    	else
      		render :json => "Ошибочка".to_json, status: :error
    	end
  	end

  	def destroy
    	session[:teacher_id] = nil
    	render :destroy, status: :success
  	end

end
