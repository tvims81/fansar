module TeachersHelper

  def authorize_teacher
    @teacher = Teacher.find(params[:id])
    render json: "Ошибка доступа, нет прав на данное действие".to_json, status: :unauthorized if current_user != @teacher
  end

end
