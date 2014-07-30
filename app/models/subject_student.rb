class SubjectStudent < ActiveRecord::Base
	belongs_to :student
	belongs_to :subject

	validates_uniqueness_of :student_id, scope: :subject_id, 
	message: "Вы уже выбрали этот предмет"



  def self.calculate_average_score_and_homeworks_count_for student, subject

    subject_student = self.where(student_id: student.id, subject_id: subject.id).take


    homeworks = subject.homeworks.where(student_id: student.id)

    homeworks_count = 0
    score_sum = 0

    homeworks.each do |homework|

      score_sum += homework.score
      homeworks_count += 1

    end


    if homeworks_count != 0
      subject_student.average_score = score_sum/homeworks_count
    else
      subject_student.average_score = 0
    end

  end



  def self.calculate_average_scores_and_homeworks_count

    subject_students = self.all

    subject_students.each do |subject_student|

    subject = subject_student.subject

    score_sum = 0
    homeworks_count = 0

    # все домашки по предмету этого студента
    homeworks = subject.homeworks.where(student_id: subject_student.student.id)

    homeworks.each do |homework|

        score_sum += homework.score
        homeworks_count += 1

      end

      subject_student.homeworks_count = homeworks_count

      if homeworks_count != 0
        subject_student.average_score = score_sum/homeworks_count
      else
        subject_student.average_score = 0
      end

    end

  end

end
