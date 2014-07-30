class Lecture < ActiveRecord::Base

	belongs_to :subject
	belongs_to :teacher

	has_many :documents, as: :docable, dependent: :destroy 
	accepts_nested_attributes_for :documents, :reject_if => :all_blank , :allow_destroy => true


	has_many :videos, dependent: :destroy 
	accepts_nested_attributes_for :videos, :reject_if => :all_blank , :allow_destroy => true


	has_many :homeworks, dependent: :destroy

end
