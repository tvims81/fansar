class Subject < ActiveRecord::Base

  has_many :lectures , dependent: :destroy
  has_many :homeworks, through: :lectures
	has_many :documents, through: :lectures
	has_many :videos, through: :lectures
	
	has_many :subject_students
	has_many :students, through: :subject_students

	has_many :subject_teachers
	has_many :teachers, through: :subject_teachers



  def self.calculate_average_scores

    subjects = self.all # все предметы

    subjects.each do |subject|

      score_sum = 0
      homeworks_count = 0

      subject.homeworks.each do |homework|

          score_sum += homework.score
          homeworks_count += 1

      end

      if homeworks_count != 0
        subject.average_score = score_sum/homeworks_count
      else
        subject.average_score = 0
      end

    end

  end

end
