module LecturesHelper

  def lecture_create_authorize
    render json: "Только преподователи могут создавать лекции", status: :unauthorized if current_user.class.name == "Student"
  end



  def lecture_destroy_and_update_authorize
    if current_user.class.name == "Student" || current_user != @lecture.teacher
      render json: "Только создатель лекции может редактировать и удалять лекцию", status: :unauthorized
    end
  end

end
