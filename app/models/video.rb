class Video < ActiveRecord::Base

  validates :code, presence: { message: "Код видео не может быть пустым" }

	belongs_to :lecture

end
