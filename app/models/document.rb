class Document < ActiveRecord::Base
  validates :file, presence: { message: "Выберите файл" }

	belongs_to :docable, polymorphic: true
end
