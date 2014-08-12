module SessionsHelper


	def teacher_sign_in teacher
    session[:student_id] = nil
    session[:teacher_id] = teacher.id
  end



  def student_sign_in student
    session[:teacher_id] = nil
    session[:student_id] = student.id
 	end



 	def sign_out
 		session[:teacher_id] = nil
 		session[:student_id] = nil
 	end 	


  def current_user
    	@current_user ||= current_teacher
    	@current_user ||= current_student 
  end



  def current_teacher
  	if session[:teacher_id] != nil
      @current_teacher = Teacher.find(session[:teacher_id])
    else
  		nil
    end 
  end



  def current_student
    if session[:student_id] != nil
      		@current_student = Student.find(session[:student_id]) 
    else
    	nil
    end
  end



  def authenticate_user
    render json: "Ошибка доступа, залогиньтесь".to_json , status: :forbidden if current_user.nil?
  end


end
