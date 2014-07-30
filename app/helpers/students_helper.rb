module StudentsHelper

  def authorize_student
    @student = Student.find(params[:id])
    render json: "Ошибка доступа, нет прав на данное действие".to_json, status: :unauthorized if current_user != @student
  end

end

