module HomeworksHelper

  def homework_rate_authorize
    render json: "Только создатель лекции может оценивать домашние задания принадлежащие ", status: :unauthorized if @homework.lecture.teacher != current_user
  end



  def homework_create_authorize
    render json: "Только ученики могут отправлять домашние задания", status: :unauthorized if current_student.nil?
  end



  def homework_destroy_and_update_authorize
    render json: "Только отправивший домашнее здание может редактировать и удалять ее",status: :unauthorized if current_user != @homework.student
  end

  def calculate_average_score_and_homeworks_count
    SubjectStudent.delay.calculate_average_score_and_homeworks_count_for @homework.student, @homework.lecture
  end


end
